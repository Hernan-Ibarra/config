# My Neovim Configuration

Here I will explain some things going on in my personal configuration so that I don't forget them.

## Philosophy

After much studying, I still don't fully grok the elusive Vim Philosophy. I am making progress though. I will leave learnt lessons in this section.

### Plugins

Plugins are a burden. Technical debt. Unknown complexity. They must be avoided.

But having no plugins is a pain. We should take advantage of the work other people do for the community. Making things work is hard enough.

So, what is the correct balance? This is a difficult question, but I will attempt to answer it nonetheless.

A plugin solves a problem. If the plugin doesn't solve a problem, then it is useless. But even if it does, we have to ask ourselves whether:

- the problem can be tolerated;
- the problem is %80 solved by built-in features;
- the problem can be solved by ourselves.

The last point is really important. As your abilities grow, you should need fewer plugins. You will be able to approach other people's code in a take-what-you-need basis, or simply write a solution from scratch. That is really the best way. You might think that we don't have time to reinvent the wheel. Then you would be forgetting that Vim is a lifelong journey, and we can afford the time investment (especially in these early days).

For example, having plugins that deal with LSPs for you is reasonable. This is something that is hard to do on your own (for the moment at least).
