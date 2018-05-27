#  Blog setup 

- [Install ipfs](https://ipfs.io/docs/install/) and follow [Getting Started](https://ipfs.io/docs/getting-started/)
- Setup Blog directory with all the contents to be published
- Generate a fresh key pair for my blog `ipfs key gen -t=rsa -s=2048 myBlog`
- Add Blog to ipfs ( symbolic links wont work)
  ```
  ipfs add -r myBlog/
  added QmWATWQ7fVPP2EFGu71UkfnqhYXDYH566qy47CnJDgvs8u myBlog/FirstPost.md
  added QmbTCzWx2Bp37KoTRzxKSMykySSEUZDxk9NWkjFTn6o65G myBlog/home.md
  added QmdLGf9vz89hYJrVNEynHicdsprt8865izR9wCPWSWq6bG myBlog
  ```
- Publish the Blog on ipns `ipfs name publish --key=myBlog /ipfs/QmdLGf9vz89hYJrVNEynHicdsprt8865izR9wCPWSWq6bG`

> At the time of writing this post Filecoin is not live, so it is not fully decentralized. So I'm adding dns txt record for getting rid of ugly hashes and using *https://gateway.ipfs.io/ipns/blog.shivgupt.com/<filePath>* for links
