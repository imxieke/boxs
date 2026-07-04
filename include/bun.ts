#!/usr/bin/env bun

import { env, file, markdown, sleep, sleepSync } from "bun";

import { hello } from "@/utils/hello.ts"

import { mkdir, readdir } from "node:fs/promises";
import * as dir from "node:fs/promises";
import { resolve } from "path";
import { color } from "bun" with { type: "macro" };

console.log("hello");
// await sleep(1000);
console.log("hello one second later!");

// const oneSecondInFuture = new Date(Date.now() + 1000);

// console.log("hello");
// await Bun.sleep(oneSecondInFuture);
// console.log("hello one second later!");

// console.log("hello");
// Bun.sleepSync(1000); // blocks thread for one second
// console.log("hello one second later!");

// await using view = new Bun.WebView();

// await view.navigate("https://www.baidu.com");

// console.log(view.title);

// await view.click("a[href]"); // waits for the link to be clickable
// const title = await view.evaluate("document.title");

// await Bun.write("page.png", await view.screenshot());

// console.log(env.PHP_VERSION);

// hello();

// console.log(env.USER);

// console.log(import.meta.file);
// console.log(import.meta.dir);
// console.log(import.meta.path);


// console.log(import.meta.dir + "/" + import.meta.file)