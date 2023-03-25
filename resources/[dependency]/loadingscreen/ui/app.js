const { createApp } = Vue;

var tag = document.createElement("script");
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName("script")[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

let vueApp = createApp({
  data() {
    return {
      visible: true,
      timer: null,
      config: CONFIG,
      override: false,
      timeout: null,
      loading: false,
      elapsedtime: null,
      elapsedtimer: null,
      starttime: null,
      player: null
    };
  },
  mounted() {
    this.loading = true;

    this.startCallback();

    this.starttime = Date.now();
    if (this.config.timeelapsed) {
      this.elapsedtimer = setInterval(() => {
        let d = Date.now() - this.starttime;

        var msec = d;

        var hour = Math.floor(msec / 1000 / 60 / 60);
        msec -= hour * 1000 * 60 * 60;
        var min = Math.floor(msec / 1000 / 60);
        msec -= min * 1000 * 60;
        var sec = Math.floor(msec / 1000);
        msec -= sec * 1000;

        this.elapsedtime = `${hour != 0 ? hour + "h " : ""}${
          min != 0 ? min + "m " : ""
        }${sec}s`;
      }, 1000);
    }

    if (this.config.video.active) {
      var vid = document.getElementById("videocomp");
      vid.volume = this.config.video.volume;

      vid.addEventListener(
        "ended",
        () => {
          this.visible = false;
          clearInterval(this.timer);
        },
        false
      );
    }

    // Set volume for the audio
    if (this.config.audio.active) {
      var vid = document.getElementById("audiocomp");
      vid.volume = this.config.audio.volume;
    }
  },
  destroyed() {
    window.removeEventListener("message");

    this.yt = false;
    this.image = false;

    var iframe = element.querySelector("iframe");
    var video = element.querySelector("video");
    if (iframe) {
      var iframeSrc = iframe.src;
      iframe.src = iframeSrc;
    }
    if (video) {
      video.pause();
    }
  },
  computed: {
    cssvars() {
      return {
        "--color": "#fff",
        "--backgroundcolor": this.config.image.backgroundcolor,
        "--backgroundimage": this.config.image.source,
        "--loadingcolor": this.config.loading.color,
      };
    },
  },
  methods: {
    initYoutube() {
      const that = this;

      if (this.config.youtube.active) {
        this.player = new YT.Player("ytplayer", {
          width: window.innerWidth,
          height: window.innerHeight,
          videoId: this.config.youtube.source,
          playerVars: {
            'playsinline': 1,
            'controls': 0,
            'mute': this.config.youtube.mute,
            'autoplay': 1
          },
          events: {
            onReady: that.onPlayerReady,
            onStateChange: that.onPlayerStateChange
          }
        });
      }
    },
    onPlayerReady(evt) {
      evt.target.setVolume(this.config.youtube.volume);
      evt.target.playVideo();
    },
    onPlayerStateChange(evt) {
      if (evt.data === 0) {
        if (this.config.youtube.looped) {
          this.player.playVideo(); 
        } else if (this.visible) {
          this.visible = false;
          clearInterval(this.timer);
        }
      }
    },
    onMessage(event) {
      if (event.data.action === "toggle") {
        this.visible = !this.visible;
      }
    },
    startCallback() {
      this.timer = setInterval(() => {
        fetch(`https://gum_character/isgameinitiated`, {method: "POST",headers: {"Content-Type": "application/json; charset=UTF-8",},})
        .then((resp) => resp.json())
          .then((resp) => {
            this.loading = false;
            if (resp.spacebar == true && this.config.loadtime.skip) {
              this.visible = false;
              clearInterval(this.timer);
            } else if (resp.online) {
              this.loading = false;

              let isvideolooped = this.config.video.looped == false && this.config.video.active == true
              let isYTlooped = this.config.youtube.looped == false && this.config.youtube.active == true

              if (!(isvideolooped || isYTlooped)) {
                this.visible = false;
                clearInterval(this.timer);
              }
            }
          })
          .catch((e) => {});
      }, 1000);
    },
  },
}).mount("#app");

// Youtube API Shim for vue
window.onYouTubeIframeAPIReady = () => {
  vueApp.initYoutube()
};
