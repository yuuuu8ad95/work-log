import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const html = `<p>${data.content.text}</p>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});
