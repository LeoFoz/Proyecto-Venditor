(this["webpackJsonpmy-app"]=this["webpackJsonpmy-app"]||[]).push([[0],{21:function(t,e,c){},42:function(t,e,c){"use strict";c.r(e);var n=c(2),r=c(15),s=c.n(r),a=c(3),i=c.n(a),j=c(6),o=c(4),d=(c(21),c(22),c(0));var h=function(){var t=Object(n.useState)(""),e=Object(o.a)(t,2),c=(e[0],e[1],Object(n.useState)("")),r=Object(o.a)(c,2),s=(r[0],r[1],Object(n.useState)([])),a=Object(o.a)(s,2),h=a[0],l=a[1],b=Object(n.useState)([]),u=Object(o.a)(b,2),p=u[0],O=u[1];function x(){return(x=Object(j.a)(i.a.mark((function t(){var e,c;return i.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return"http://localhost:3002/ofertas",t.next=3,fetch("http://localhost:3002/ofertas");case 3:return e=t.sent,t.next=6,e.json();case 6:c=t.sent,O(c[0]),m();case 9:case"end":return t.stop()}}),t)})))).apply(this,arguments)}function f(){return(f=Object(j.a)(i.a.mark((function t(){var e,c;return i.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return"http://localhost:3002/Prod",t.next=3,fetch("http://localhost:3002/Prod");case 3:return e=t.sent,t.next=6,e.json();case 6:c=t.sent,l(c),m();case 9:case"end":return t.stop()}}),t)})))).apply(this,arguments)}function m(){setTimeout(v,5e3)}function v(){l([]),O([])}return Object(d.jsxs)("div",{className:"App",children:[Object(d.jsx)("h1",{children:" Venditor Demo"}),Object(d.jsx)("div",{className:"form"}),Object(d.jsx)("button",{onClick:function(){return x.apply(this,arguments)},children:"Ver Mejores Bids para vendedor"}),Object(d.jsxs)("table",{className:"table table-dark",children:[Object(d.jsx)("thead",{children:Object(d.jsxs)("tr",{children:[Object(d.jsx)("th",{children:"Description"}),Object(d.jsx)("th",{children:"posttime"})]})}),Object(d.jsx)("tbody",{children:p.map((function(t,e){return Object(d.jsxs)("tr",{children:[Object(d.jsxs)("td",{children:[" ",t.Description]}),Object(d.jsxs)("td",{children:[" ",t.posttime]})]})}))})]}),Object(d.jsx)("button",{onClick:function(){return f.apply(this,arguments)},children:"Ver productos "}),Object(d.jsxs)("table",{className:"table table-dark",children:[Object(d.jsx)("thead",{children:Object(d.jsxs)("tr",{children:[Object(d.jsx)("th",{children:"Name"}),Object(d.jsx)("th",{children:"Description"})]})}),Object(d.jsx)("tbody",{children:h.map((function(t,e){return Object(d.jsxs)("tr",{children:[Object(d.jsxs)("td",{children:[" ",t.Name]}),Object(d.jsxs)("td",{children:[" ",t.PriceSale]})]},"".concat(t.Productid))}))})]})]})};s.a.render(Object(d.jsx)(h,{}),document.getElementById("root"))}},[[42,1,2]]]);
//# sourceMappingURL=main.4d1f4cc3.chunk.js.map