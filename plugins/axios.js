export default ({ $axios }) => {
  // request log
  $axios.onRequest((config) => {
    console.log(config);
  });

  // response log
  $axios.onResponse((config) => {
    console.log(config);
  });

  // error log
  $axios.onError((e) => {
    console.log(e.response);
  });
};
