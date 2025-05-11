var NotifyIndex = 0;

const DestroyNotify = async function (index, timeout) {
  $("#notify_" + index).css("animation", "slideIn 0.5s forwards");
  $("#notify_" + index).fadeIn();
  setTimeout(async () => {
    $("#notify_" + index).css("animation", "slideOut 0.5s forwards");
    $("#notify_" + index).fadeOut();
    setTimeout(async () => {
      $("#notify_" + index).remove();
    }, 1000);
  }, timeout + 1000);
};

const AddNotify = async function (type, message, timeout) {
  NotifyIndex = NotifyIndex + 1;

  if (type !== "info" && type !== "error" && type !== "warning") {
    type = "info";
  }

  if (type == "info") {
    $(".notifys").append(`
      <div class="notify" id="notify_${NotifyIndex}" style="display: none;">
          <div class="information-box"></div>
          <img class="vector2" src="./icons/vector1.svg" />
          <div class="information">INFORMATION</div>
          <div class="notify-text">${message}</div>
      </div>
    `);
  } else if (type === "error") {
    $(".notifys").append(`
        <div class="notify" id="notify_${NotifyIndex}" style="display: none;">
          <div class="warning-box"></div>
          <div class="warning2">ERROR</div>
          <div class="notify-text">${message}</div>
          <img class="icon" src="./icons/icon0.svg" />
      </div>
    `);
  } else if (type === "warning") {
    $(".notifys").append(`
        <div class="notify" id="notify_${NotifyIndex}" style="display: none;">
          <div class="rectangle-363"></div>
          <div class="notify-text">${message}</div>
          <div class="warning3">WARNING</div>
          <img class="error-16-svgrepo-com-1" src="./icons/error-16-svgrepo-com-10.svg" />
      </div>
    `);
  }
  DestroyNotify(NotifyIndex, timeout);
};

const playSound = function(sound) {
  var audio = new Audio();
  audio.src = sound.url;
  audio.volume = sound.volume;
  audio.play();
};

window.addEventListener("message", (event) => {
  const data = event.data;
  const action = data.action;

  switch (action) {
    case "AddNotification":
      AddNotify(data.type, data.message, data.timeout);
    break;
    case "playSound":
      playSound(data.sound) 
    break;
  }
});