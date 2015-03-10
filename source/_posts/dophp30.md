title: Netbeans个人许可证License存档
tags:
  - License
  - Netbeans
id: 1010
categories:
  - code
date: 2013-07-29 17:13:46
---

>工具-&gt;模板-&gt;许可证-&gt;编辑
```bash
&lt;#if licenseFirst??&gt;
${licenseFirst}
&lt;/#if&gt;
${licensePrefix} date ${date} ${time}
${licensePrefix} code ${encoding}
${licensePrefix} author lurrpis
&lt;#if licenseLast??&gt;
${licenseLast}
&lt;/#if&gt;
```