
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  if (htmlElement.children) {
    Array.from(htmlElement.children).forEach((child) => {
      htmlElement.removeChild(child);
    })
  }

  let ele = document.createElement('p');
  ele.innerHTML = string;
  htmlElement.appendChild(ele);
};

htmlGenerator('Minty Fresh Color', partyHeader);