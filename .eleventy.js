module.exports = function(eleventyConfig) {
  // Copy static assets and CSS
  eleventyConfig.addPassthroughCopy("assets");
  eleventyConfig.addPassthroughCopy("src/css");
  return {
    dir: {
      input: "src"
    }
  };
};
