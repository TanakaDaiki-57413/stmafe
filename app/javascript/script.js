import Raty from "raty-js";

document.addEventListener("turbo:before-cache", () => {
  document.querySelectorAll(".raty").forEach((element) => {
    element.innerHTML = ""
  })
})

document.addEventListener("turbo:load", () => {
  const postElem = document.querySelector("#post_raty");

  if (postElem) {
    new Raty(postElem, {
      half: true,
      scoreName: "review[rate]",
      starOn: postElem.dataset.starOn,
      starOff: postElem.dataset.starOff,
      starHalf: postElem.dataset.starHalf,
    }).init();
  }

  const element = document.getElementById("edit_raty")

  if (element) {
    const raty = new Raty(element, {
      score: element.dataset.score,
      scoreName: "review[rate]",
      half: true,
      starOn: element.dataset.starOn,
      starOff: element.dataset.starOff,
      starHalf: element.dataset.starHalf
    })

    raty.init()
  }

  const showElem = document.querySelector("#show_raty");

  if (showElem) {
    new Raty(showElem, {
      readOnly: true,
      half: true,
      score: Number(showElem.dataset.rate),
      starOn: showElem.dataset.starOn,
      starOff: showElem.dataset.starOff,
      starHalf: showElem.dataset.starHalf,
    }).init();
  }

  const allRaty = document.querySelectorAll("#all_show_raty");

  if (allRaty) {
    allRaty.forEach((element) => {
      new Raty(element, {
        readOnly: true,
        half: true,
        score: Number(element.dataset.score),
        starOn: element.dataset.starOn,
        starOff: element.dataset.starOff,
        starHalf: element.dataset.starHalf,
      }).init();
    });
  }
});