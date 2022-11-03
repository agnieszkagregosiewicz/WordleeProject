function ia(h) {
    var d = 0;
    return function () {
        return d < h.length ? {done: !1, value: h[d++]} : {done: !0}
    }
}

var W = "function" == typeof Object.defineProperties ? Object.defineProperty : function (h, d, m) {
    if (h == Array.prototype || h == Object.prototype) return h;
    h[d] = m.value;
    return h
};

function ya(h) {
    h = ["object" == typeof globalThis && globalThis, h, "object" == typeof window && window, "object" == typeof self && self, "object" == typeof global && global];
    for (var d = 0; d < h.length; ++d) {
        var m = h[d];
        if (m && m.Math == Math) return m
    }
    throw Error("Cannot find global object");
}

var za = ya(this);

function X(h, d) {
    if (d) a:{
        var m = za;
        h = h.split(".");
        for (var n = 0; n < h.length - 1; n++) {
            var u = h[n];
            if (!(u in m)) break a;
            m = m[u]
        }
        h = h[h.length - 1];
        n = m[h];
        d = d(n);
        d != n && null != d && W(m, h, {configurable: !0, writable: !0, value: d})
    }
}

X("Symbol", function (h) {
    function d(l) {
        if (this instanceof d) throw new TypeError("Symbol is not a constructor");
        return new m(n + (l || "") + "_" + u++, l)
    }

    function m(l, L) {
        this.g = l;
        W(this, "description", {configurable: !0, writable: !0, value: L})
    }

    if (h) return h;
    m.prototype.toString = function () {
        return this.g
    };
    var n = "jscomp_symbol_" + (1E9 * Math.random() >>> 0) + "_", u = 0;
    return d
});
X("Symbol.iterator", function (h) {
    if (h) return h;
    h = Symbol("Symbol.iterator");
    for (var d = "Array Int8Array Uint8Array Uint8ClampedArray Int16Array Uint16Array Int32Array Uint32Array Float32Array Float64Array".split(" "), m = 0; m < d.length; m++) {
        var n = za[d[m]];
        "function" === typeof n && "function" != typeof n.prototype[h] && W(n.prototype, h, {
            configurable: !0,
            writable: !0,
            value: function () {
                return Aa(ia(this))
            }
        })
    }
    return h
});

function Aa(h) {
    h = {next: h};
    h[Symbol.iterator] = function () {
        return this
    };
    return h
}

function Ba(h, d) {
    h instanceof String && (h += "");
    var m = 0, n = !1, u = {
        next: function () {
            if (!n && m < h.length) {
                var l = m++;
                return {value: d(l, h[l]), done: !1}
            }
            n = !0;
            return {done: !0, value: void 0}
        }
    };
    u[Symbol.iterator] = function () {
        return u
    };
    return u
}

X("Array.prototype.keys", function (h) {
    return h ? h : function () {
        return Ba(this, function (d) {
            return d
        })
    }
});
(function () {
    function h(a, b, c) {
        c = void 0 === c ? "style" : c;
        Object.keys(b).forEach(function (e) {
            a[c][e] = b[e]
        })
    }

    function d(a, b, c) {
        var e = document.createElement(a);
        if ("undefined" == typeof b) return e;
        Object.keys(b).forEach(function (g) {
            "object" == typeof b[g] ? h(e, b[g], g) : e[g] = b[g]
        });
        if ("undefined" == typeof c) return e;
        m(e, c);
        return e
    }

    function m(a, b) {
        Array.isArray(b) || (b = [b]);
        b.forEach(function (c) {
            null != c && a.appendChild("string" == typeof c ? document.createTextNode(c) : c)
        })
    }

    function n(a, b) {
        a.innerHTML = "";
        m(a, b)
    }

    function u(a,
               b, c) {
        void 0 === c || c ? a.classList.add(b) : a.classList.remove(b)
    }

    function l(a) {
        return Ca[a] || a
    }

    function L(a, b) {
        b = void 0 === b ? "" : b;
        u(G[v], "gwrong", a);
        a && n(Y[v], b);
        u(D, "werror", a)
    }

    function Z(a) {
        H && ("<" == a || "BACKSPACE" == a ? x.length && (x.pop(), n(K[v][x.length], "\u00a0"), L(!1)) : " " == a || 0 > I.indexOf(a) || x.length >= A.length || (a = a.toUpperCase(), x.push(a), n(K[v][x.length - 1], a), x.length == A.length && Da()))
    }

    function ja(a, b) {
        var c = {}, e = [], g = b.split("");
        g.forEach(function (f) {
            return c[f] = 0
        });
        g.forEach(function (f, k) {
            e[k] = f ==
            a[k] ? 3 : 0;
            f != a[k] && c[f]++
        });
        a.forEach(function (f, k) {
            f != g[k] && (c[f] ? (e[k] = 2, c[f]--) : e[k] = 1)
        });
        return e
    }

    function ka(a, b) {
        a.forEach(function (c, e) {
            if (!B[c] || b[e] > B[c]) B[c] = b[e]
        })
    }

    function Ea(a, b, c, e) {
        var g = e ? 8 : 0, f = 0, k = setInterval(function () {
            0 <= f && f < a.length && (a[f].dataset.col = b[f] + "");
            f >= a.length && (a[0].parentNode.style.opacity = Math.floor((f - a.length) / 2) % 2 ? 1 : .6);
            f++;
            f >= a.length + g && (clearInterval(k), c && c())
        }, 64)
    }

    function Da() {
        var a = x.join("");
        if (a == A || Fa(a)) {
            var b = ja(x, A);
            E.push(x);
            C.push(b);
            u(G[v], "gactive",
                !1);
            u(G[v], "gfilled");
            ka(x, b);
            for (var c in B) M[c] && (M[c].dataset.col = B[c]);
            var e = (c = a == A) || 5 <= v, g = "";
            e && (g = (c ? v + 1 : "X") + "/6");
            Ea(K[v], C[v], e ? 0 : function () {
                return u(G[v], "gactive")
            }, c);
            q.gs[y].push(a);
            e && q.rs.push(g);
            q.ts = Math.floor(Date.now() / 1E3);
            F[y].push(b);
            try {
                var f = JSON.stringify(q);
                localStorage.setItem(aa, f)
            } catch (k) {
            }
            e ? (a = Date.now() - la, b = E.map(function (k) {
                return k.join("")
            }).join(","), f = C.map(function (k) {
                return k.join("")
            }).join(","), ba = !0, N({
                tp: "play", word: A, wnum: y, pdur: a, pwords: b, pcols: f, pres: c ?
                    v : -1, wd: z.wd, wc: z.wc
            }, function () {
                ba = !1;
                ca && ca()
            }), ma(c)) : (x = [], v++)
        } else L(!0, l("SLNOTAWORD"))
    }

    function ma(a) {
        H = !1;
        h(na, {display: "none"});
        var b;
        var c = d("p", {style: {fontWeight: "bold"}}, a && 1 == q.gs[y].length ? l("SLSEER") + " \ud83d\ude35" : a ? l("SLGOTIT") + " \ud83d\ude0e" : [l("SLTHATWAS") + " " + A, d("a", {
            href: "https://sjp.pl/" + A.toLowerCase(),
            target: "_blank",
            style: {marginLeft: ".5em", textDecoration: "none", color: "inherit", fontWeight: "normal", opacity: ".5"}
        }, "(?)")]);
        if (y + 1 < J.length && (a || 2 != w)) c = d("div", {className: "mbox"},
            [c, oa ? d("p", {}, l("SLCRSCORE") + " " + (y + 1)) : null, d("p", {style: {marginBottom: "4em"}}, [b = d("button", {
                className: "minw",
                onclick: function () {
                    pa(y + 1)
                }
            }, l("SLNEXT"))])]); else {
            if (2 == w) try {
                window.sessionStorage.removeItem("slcur")
            } catch (t) {
            }
            var e = "";
            0 == w ? e = O + " " + q.rs.join(" ") : 1 == w ? e = O + " #" + l("SLTODAY") + " " + q.rs.join(" ") : 2 == w && (e = O + " #" + l("SLRAND") + " " + l("SLSCORE") + " " + (y + (a ? 1 : 0)));
            var g = "";
            F.forEach(function (t, p) {
                g = (2 != w ? g + (0 < p ? "\n" : "") : "") + t.map(function (r) {
                        return r.map(function (P) {
                            return Ga[P]
                        }).join("")
                    }).join("\n") +
                    "\n"
            });
            a = e + "\n\n" + g;
            e = Q && "function" == typeof navigator.share;
            var f, k;
            c = d("div", {className: "mbox"}, [c, k = d("p", {
                style: {
                    color: "#e22",
                    fontWeight: "bold"
                }
            }, ""), d("p", {}, f = d("textarea", {
                style: {
                    width: "16em",
                    height: "1.2em",
                    lineHeight: 1.2
                }
            }, a)), d("p", {style: {marginTop: "-.7em"}}, [d("button", {
                style: {borderColor: "transparent", paddingLeft: ".5em", paddingRight: ".5em"},
                onclick: e ? function () {
                    try {
                        navigator.share({text: f.value.trim()})
                    } catch (t) {
                    }
                } : function () {
                    try {
                        f.select(), f.setSelectionRange(0, 999)
                    } catch (t) {
                    }
                    try {
                        navigator.clipboard.writeText(f.value)
                    } catch (t) {
                    }
                },
                title: l("SLSHARE"),
                innerHTML: '\n<svg style="fill: currentColor; stroke: currentColor; stroke-width: 1px; width: 20px; height: 20px; margin-top: -1px; vertical-align: middle;" viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">\n<path fill="none" stroke-width="1.6" d="M16 4l-12 7l12 7"></path>\n<circle cx="16" cy="4" r="2.5" />\n<circle cx="4" cy="11" r="2.5" />\n<circle cx="16" cy="18" r="2.5" />\n</svg>\n'
            }), " ", 0 != w ? d("a", {
                    href: "https://twitter.com/intent/tweet?text=" + encodeURIComponent(a),
                    target: "_blank",
                    title: "tweet",
                    innerHTML: '\n<svg style="width: 25px; height: 20px; padding: 4px; margin-top: 1px; vertical-align: middle; fill: #1D9BF0;" version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 248 204">\n<g><path d="M221.95,51.29c0.15,2.17,0.15,4.34,0.15,6.53c0,66.73-50.8,143.69-143.69,143.69v-0.04 C50.97,201.51,24.1,193.65,1,178.83c3.99,0.48,8,0.72,12.02,0.73c22.74,0.02,44.83-7.61,62.72-21.66 c-21.61-0.41-40.56-14.5-47.18-35.07c7.57,1.46,15.37,1.16,22.8-0.87C27.8,117.2,10.85,96.5,10.85,72.46c0-0.22,0-0.43,0-0.64 c7.02,3.91,14.88,6.08,22.92,6.32C11.58,63.31,4.74,33.79,18.14,10.71c25.64,31.55,63.47,50.73,104.08,52.76 c-4.07-17.54,1.49-35.92,14.61-48.25c20.34-19.12,52.33-18.14,71.45,2.19c11.31-2.23,22.15-6.38,32.07-12.26 c-3.77,11.69-11.66,21.62-22.2,27.93c10.01-1.18,19.79-3.86,29-7.95C240.37,35.29,231.83,44.14,221.95,51.29z"/></g>\n</svg>\n'
                }) :
                null])]);
            1 == w && (a = function () {
                N({tp: "stat"}, function (t) {
                    try {
                        var p = [];
                        JSON.parse(t).stlines.split("\n").forEach(function (r) {
                            return p.push(r, d("br", {}))
                        });
                        n(k, p)
                    } catch (r) {
                    }
                })
            }, ba ? ca = a : a())
        }
        n(qa, c);
        b && b.focus()
    }

    function pa(a) {
        y = a;
        A = J[a];
        q.gs[a] || (q.gs[a] = []);
        F[a] || (F[a] = []);
        v = q.gs[a].length;
        x = [];
        E = q.gs[a].map(function (c) {
            return c.split("")
        });
        C = F[a].slice();
        B = {};
        E.forEach(function (c, e) {
            return ka(c, C[e])
        });
        H = y >= q.rs.length && 6 > v;
        la = Date.now();
        Ha();
        if (!H) {
            a = q.gs[y].length;
            var b = !1;
            a && q.gs[y][a - 1] == A && (b =
                !0);
            ma(b)
        }
    }

    function ra(a, b, c) {
        J = a;
        w = b;
        oa = 2 == b;
        aa = b + "/" + c;
        q = {gs: [], rs: [], ts: 0};
        try {
            var e = localStorage.getItem(aa), g;
            e && (g = JSON.parse(e)) && (q = g)
        } catch (f) {
        }
        F = [];
        q.gs.forEach(function (f, k) {
            F[k] = f.map(function (t) {
                return ja(t.split(""), J[k])
            })
        });
        a = Math.min(q.rs.length, J.length - 1);
        0 < a && 2 == w && "X" == q.rs[a - 1][0] && a--;
        pa(a)
    }

    function Ia(a, b) {
        if (0 == a.length || -1 == b) ra("x", ["AAAAA", "AAAAA"], -1); else {
            var c = Ja(a), e = c.split(" ").filter(function (g) {
                return "" != g
            }).reverse();
            if (" " == c[0] || "  " == c.slice(-2)) b = 2;
            ra(e, b,
                a)
        }
    }

    function Fa(a) {
        if (da) {
            a = a.split("");
            for (var b = da; 0 < a.length;) {
                var c = a.shift();
                if (!b.n[c]) return !1;
                b = b.n[c]
            }
            return !!b.t
        }
        alert("Dictionary error")
    }

    function Ka() {
        var a = sa = new XMLHttpRequest;
        a.open("GET", z.dict || "wl.txt");
        a.onreadystatechange = function () {
            if (4 == a.readyState && 200 == a.status && a == sa) {
                for (var b = a.responseText, c = b.length, e = 0, g = [], f = 0; e + 1 < c;) {
                    var k = b[e++];
                    k = g[f] = "1" == k ? {n: {}, t: 1} : {n: {}};
                    for (f++; e + 1 < c;) {
                        var t = b[e++], p = e;
                        if ("\n" == t || " " == t) break;
                        for (; e < c && !("0" > b[e] || "9" < b[e]);) e++;
                        e > p && (k.n[t] =
                            b.substring(p, e))
                    }
                }
                for (b = 0; b < g.length; b++) {
                    k = g[b];
                    for (var r in k.n) k.n[r] = g[k.n[r]]
                }
                da = g[0]
            }
        };
        a.send()
    }

    function R(a, b) {
        b = void 0 === b ? {} : b;
        var c = d("p", {style: {position: "absolute", right: 0}}, [d("div", {
            style: {
                padding: ".5em 1em",
                borderColor: "transparent",
                marginTop: "-.5em",
                cursor: "pointer"
            }, onclick: function () {
                return R(0)
            }
        }, "X")]);
        if (0 == a) var e = d("p", {}, d("button", {
            onclick: function () {
                return R(1)
            }
        }, l("SLPICK"))); else if (1 == a) {
            var g = function (p) {
                for (var r = 0; r < p.length; r++) if (" " == p[r] || 0 > I.indexOf(p[r])) return !1;
                return !0
            }, f, k;
            e = d("div", {className: "mbox"}, [c, d("p", {}, l("SLPICK")), d("form", {
                onsubmit: function () {
                    var p = f.value.trim().toUpperCase();
                    if (3 > p.length || 6 < p.length || !g(p)) f.value = "", f.focus(); else {
                        var r = k.value.trim().toUpperCase();
                        if (3 > r.length || 6 < r.length || !g(r)) k.value = "", k.focus(); else {
                            var P = La(([p, r].reverse().join(" ") + " ").toUpperCase());
                            R(2, {url: ta + "?" + P});
                            N({tp: "gen", wd: P, wpl: p + " " + r, gact: H ? 1 : 0})
                        }
                    }
                    return !1
                }
            }, [d("p", {}, [f = d("input", {
                className: "ttup", spellcheck: !1, autocorrect: "off", style: {width: "8em"},
                onkeypress: function (p) {
                    if (" " == p.key) return k.focus(), !1
                }
            }), " ", k = d("input", {
                className: "ttup",
                spellcheck: !1,
                autocorrect: "off",
                style: {width: "8em"}
            })]), d("p", {}, d("button", {className: "minw"}, l("SLOK")))]), d("p", {}, l("SLTWO"))])
        } else if (2 == a) {
            var t;
            a = Q && "function" == typeof navigator.share;
            e = d("div", {className: "mbox"}, [c, d("p", {}, l("SLLINK")), d("p", {}, t = d("input", {
                className: "tac",
                style: {width: "24em", minWidth: "60%", maxWidth: "90%"},
                value: b.url || ""
            })), d("p", {}, d("button", {
                onclick: a ? function () {
                        try {
                            navigator.share({url: b.url})
                        } catch (p) {
                        }
                    } :
                    function () {
                        try {
                            t.select(), t.setSelectionRange(0, 999)
                        } catch (p) {
                        }
                        try {
                            navigator.clipboard.writeText(b.url)
                        } catch (p) {
                        }
                    },
                innerHTML: '\n<svg style="fill: currentColor; stroke: currentColor; stroke-width: 1px; width: 20px; height: 20px; margin-top: -1px; vertical-align: middle;" viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">\n<path fill="none" stroke-width="1.6" d="M16 4l-12 7l12 7"></path>\n<circle cx="16" cy="4" r="2.5" />\n<circle cx="4" cy="11" r="2.5" />\n<circle cx="16" cy="18" r="2.5" />\n</svg>\n\u00a0 ' +
                    l("SLSHARE")
            }))])
        }
        ea && n(ea, e);
        return e
    }

    function La(a) {
        if (0 == a.length) return "";
        a = a.toUpperCase();
        var b = "", c = S.length, e = 1;
        a.split("").forEach(function (f, k) {
            return e += (k + 1) * (1 + I.indexOf(f))
        });
        e %= ua;
        var g = T + U * e;
        b += V.charAt(e).toLowerCase();
        a.split("").forEach(function (f, k) {
            f = I.indexOf(f);
            b += S.charAt((f + g) % c);
            g += (k + 1) * T + (k + U) * (f + 1)
        });
        return b
    }

    function Ja(a) {
        if (0 == a.length) return "";
        var b = "", c = I.length, e = S.length, g = T + V.indexOf(a.charAt(0).toUpperCase()) % ua * U;
        a.substring(1).split("").forEach(function (f, k) {
            f =
                S.indexOf(f);
            f = (f - g % e + e) % e;
            b += I.charAt(f % c);
            g += (k + 1) * T + (k + U) * (f + 1)
        });
        return b
    }

    function fa(a) {
        for (var b = [], c = 0; c < a; c++) b[c] = 0;
        return b
    }

    function va() {
        window.location.href = window.location.href.split("?")[0].split("#")[0]
    }

    function wa(a) {
        try {
            var b = new XMLHttpRequest;
            b.onreadystatechange = function () {
                4 == b.readyState && 200 == b.status && (window.sessionStorage.setItem("slcur", b.responseText), va())
            };
            b.open("GET", "?rj=" + a + "&" + Date.now());
            b.send()
        } catch (c) {
            console.log(c)
        }
    }

    function Ha() {
        G = [];
        Y = [];
        K = fa(6);
        M = {};
        var a =
            l(0 == w ? "SLCASE0" : 1 == w ? "SLCASE1" : "SLCASE2") + " " + (y + 1) + (2 != w ? "/" + J.length : "");
        n(D, [d("h3", {}, l("SLGUESS") + ", " + a), d("p", {
            style: {
                margin: "-1em 0 1em",
                opacity: .8
            }
        }, l("SLINFO")), d("div", {className: "tac", style: {}}, fa(6).map(function (b, c) {
            return G[c] = d("div", c == v && H ? {className: "gactive"} : {}, [d("div", {}, K[c] = fa(A.length).map(function (e, g) {
                return d("div", {
                    className: "gcell",
                    dataset: {col: C[c] && C[c][g] ? C[c][g] : "0"}
                }, E[c] && E[c][g] ? E[c][g] : "\u00a0")
            })), Y[c] = d("div", {className: "wrmsg"}, "X")])
        })), na = d("div", {
            className: "tam tac",
            style: {margin: "1em 0 2em"}
        }, ["QWERTYUIOP", "ASDFGHJKL", "-ZXCVBNM<", "\u0104\u015a\u0118\u0106\u017b\u0179\u0143\u00d3\u0141"].map(function (b) {
            return d("div", {}, b.split("").map(function (c) {
                return M[c] = d("button", {
                    className: "btkey" + ("<" == c ? " bkspc klight" : ""),
                    onclick: function () {
                        return Z(c)
                    },
                    dataset: {let: c, col: B[c] ? B[c] : "0"},
                    style: "<" == c || "-" == c ? {width: "13.5%", opacity: "-" == c ? 0 : 1} : {}
                }, c)
            }))
        })), qa = d("div", {}), d("p", {}, [d("button", {
            style: {xborder: "2px solid", xfontWeight: "bold"}, onclick: function (b) {
                b.target.disabled =
                    !0;
                wa(2 != w || 6 == A.length ? 5 : 6)
            }
        }, l("SLGSRAND")), " ", d("span", {
            style: {
                position: "absolute",
                margin: "0 .5em",
                display: "inline-block"
            }
        }, [d("button", {
            style: {
                border: "solid 2px transparent",
                fontWeight: "bold",
                paddingLeft: ".5em",
                paddingRight: ".5em",
                opacity: .5
            },
            innerHTML: '\n<svg style="width: 18px; height: 18px; vertical-align: middle;" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke-width="2" stroke="currentColor" d="M4 5l5 5l5 -5"></path></svg>\n'
        }, ""), d("select", {
            onchange: function (b) {
                5 !=
                b.target.value && 6 != b.target.value || wa(b.target.value);
                b.target.selectedIndex = -1
            },
            style: {opacity: 0, position: "absolute", left: 0, top: 0, width: "100%", height: "100%", cursor: "pointer"}
        }, [d("option", {
            selected: !0,
            hidden: !0
        }, l("SLGSRAND")), d("option", {value: 5}, l("SLRAND5")), d("option", {value: 6}, l("SLRAND6"))])])]), d("p", {style: {marginBottom: "1.5em"}}, [l("SLRINFO1"), d("br", {}), l("SLRINFO2")]), ea = d("div", {}, R(0, {})), d("p", {}, d("button", {
                onclick: function () {
                    try {
                        window.sessionStorage.removeItem("slcur")
                    } catch (b) {
                    }
                    va()
                }
            },
            l("SLGSTD"))), ha ? d("p", {style: {}}, d("a", {
            href: ha,
            target: "_blank",
            style: {textDecoration: "none", color: "inherit"}
        }, l("SLFEEDBACK"))) : null])
    }

    function N(a, b) {
        b = void 0 === b ? null : b;
        try {
            var c = new FormData, e;
            for (e in a) c.append(e, "undefined" == typeof a[e] ? "" : a[e]);
            var g = new XMLHttpRequest;
            g.open("POST", "log.php");
            b && (g.onreadystatechange = function () {
                4 != g.readyState || 200 != g.status && 204 != g.status || b(g.responseText)
            });
            g.send(c)
        } catch (f) {
        }
    }

    var Ca = {
            SLTODAY: "dzi\u015b",
            SLRAND: "losowe",
            SLSCORE: "wynik",
            SLGUESS: "ODGADNIJ S\u0141OWO",
            SLCASE0: "WYBRANE",
            SLCASE1: "DZISIEJSZE",
            SLCASE2: "LOSOWE",
            SLINFO: "(\u017c\u00f3\u0142ty - litera w z\u0142ym miejscu, zielony\u00a0-\u00a0ok)",
            SLGOTIT: "BRAWO!",
            SLTHATWAS: "TO BY\u0141O:",
            SLSEER: "JASNOWIDZ!",
            SLPOS1: "PIERWSZ\u0104",
            SLPOS2: "DRUG\u0104",
            SLPOS3: "TRZECI\u0104",
            SLPOS4: "CZWART\u0104",
            SLPOS5: "PI\u0104T\u0104",
            SLPOS6: "SZ\u00d3ST\u0104",
            SLNOTAWORD: "NIE MA TAKIEGO S\u0141OWA",
            SLMUSTPOS: "%n\u00a0LITER\u0104 MUSI BY\u0106 %l",
            SLMUSTLET: "W S\u0141OWIE MUSI BY\u0106\u00a0LITERA\u00a0%l",
            SLPICK: "WYBIERZ S\u0141OWA DLA KOGO\u015a",
            SLTWO: "DWA S\u0141OWA, MAX 6 LITEROWE",
            SLOK: "OK",
            SLLINK: "LINK",
            SLSHARE: "WY\u015aLIJ",
            SLGSTD: "ODGADNIJ DZISIEJSZE",
            SLGSRAND: "LOSUJ S\u0141OWA",
            SLRINFO1: "PO TRZECH S\u0141OWACH CORAZ TRUDNIEJ,",
            SLRINFO2: "ILE ODGADNIESZ\u00a0BEZ SKUCHY?",
            SLRAND5: "5-LITEROWE",
            SLRAND6: "6-LITEROWE",
            SLDIAG: "DIAGRAM",
            SLNEXT: "NAST\u0118PNE >",
            SLCRSCORE: "AKTUALNY WYNIK:",
            SLFEEDBACK: "PRZE\u015aLIJ UWAGI",
            SLINSTALL: "ZAINSTALUJ"
        }, z = {}, ta = "", ha = null, O = "", Ga = ["X", "\u2b1b\ufe0f", "\ud83d\udfe8", "\ud83d\udfe9"], D, na, qa, ea, K,
        M, G, Y,
        y = 0, A = "", v = 0, H = !1, x = [], E = [], C = [], B = {}, la = 0, ba = !1, ca = null, J = [], aa = "-",
        w = 0, oa = 0, q, F, da = null, sa = null, V = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        I = V + " \u0104\u0106\u0118\u0141\u0143\u00d3\u015a\u0179\u017b", S = V.toLowerCase() + "0123456789", T = 13,
        U = 4, ua = 16, xa = !1, Q = !1;
    window.onload = function () {
        z = window.sldata || {};
        if (0 != z.wc) try {
            var a = window.sessionStorage.getItem("slcur"), b;
            a && (b = JSON.parse(a));
            b && b.wd && (z.wd = b.wd, z.wc = b.wc)
        } catch (e) {
        }
        ta = z.linkurl || window.location.href.split("?")[0].split("#")[0].replace("www.", "");
        O =
            z.gbrand || "#s\u0142owoku";
        ha = "/uwagi/?t=sl";
        if (D = document.getElementById("abase")) {
            a = window.navigator.userAgent || "";
            b = "MacIntel" === navigator.platform && "undefined" !== typeof navigator.standalone;
            xa = (Q = /Android|\(iPhone|\(iPod|\(iPad/.test(a) || b) && /Mobile/.test(a);
            D.innerHTML = "";
            u(D, "acont");
            u(D, "devmob", Q);
            D.ontouchstart = function () {
            };
            Object.keys(localStorage).forEach(function (e) {
                try {
                    var g = localStorage.getItem(e), f = JSON.parse(g);
                    f.ts && f.ts < Date.now() / 1E3 - 86400 && localStorage.removeItem(e)
                } catch (k) {
                }
            });
            m(document.head, d("style", {type: "text/css"}, '\n\n.acont {\n-webkit-tap-highlight-color: rgba(0,0,0,0);\nuser-select: none;\n-webkit-user-select: none;\n}\n\n.xuste { user-select: text; -webkit-user-select: text; }\ninput, textarea { user-select: text; -webkit-user-select: text; }\n\nh3 { white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size: 18px; color: #2a2; margin-top: .5em; }\n\n.acont button:not([class]) { padding-left: 20px; padding-right: 20px; }\n\n.tac { text-align: center; }\n.ttup { text-transform: uppercase; }\n\n.mbox { background: rgba(128,128,128,.1); margin: 1em 0; padding: 1px 0; border-radius: 6px; position: relative; }\n\n.acont .minw { min-width: 6em; }\n\nbutton { cursor: pointer; }\nbutton:active { opacity: .5; }\n\nbutton, .tam { touch-action: manipulation; }\n\nbutton.btkey { background: rgba(128,128,128,.2); width: 9%; padding: 0; height: 2.8em; margin: .5%; border: solid 1px rgba(128,128,128,.05); font-weight: bold; position: relative; opacity: .85; }\nbutton.btkey.klight { background: none; border: solid 2px rgba(128,128,128,.3); }\n.werror button.btkey.bkspc { border-color: red; color: red; }\n\n.acont.devmob button.btkey:active { opacity: 1; }\n\n.devmob button.btkey:active:after {\nopacity: 1;\ncontent: attr(data-let);\ndisplay: inline-block;\nborder-radius: 4px;\nposition: absolute; z-index:1;\nbottom: 120%; left: 50%;\ntransform: translateX(-50%); \npadding: .2em .4em .4em;\nfont-size: 200%;\nfont-weight: bold;\nline-height: 1.4;\nwidth: 100%; \nbackground: #343; color: #fff;\n}\n\n\n.btkey[data-col="1"], .btkey[data-col="2"], .btkey[data-col="3"] { color: #fff; }\n.btkey[data-col="1"] { background: #666; }\n.btkey[data-col="2"] { background: #ec1; }\n.btkey[data-col="3"] { background: #2a2; }\n\n\n.gwrong { position: relative; }\n\n.wrmsg { display: none; }\n.gwrong .wrmsg {\ndisplay: inline-block;\nborder-radius: 4px;\nposition: absolute; z-index: 2;\ntop: 108%; left: 50%; transform: translateX(-50%);\npadding: .5em 1em;\nbackground: red; color: #fff; font-weight: bold;\nwhite-space: nowrap;\noverflow: hidden;\ntext-overflow: ellipsis;\n}\n\n\n.gcell { width: ' +
                91.6 / 7 + '%; max-width: 2.0em; margin: 0.6%; display: inline-block; box-sizing: border-box; border: solid 2px rgba(128,128,128,.4); padding: 0; border-radius: 4px; text-align: center; font: bold 26px/1.45 sans-serif; }\n\n.gactive .gcell, .gfilled .gcell { border-color: currentColor; }\n.gwrong .gcell { border-color: red; color: red; }\n\n.gcell[data-col="1"], .gcell[data-col="2"], .gcell[data-col="3"]\n { border-color: transparent; color: #fff; }\n\n.gcell[data-col="1"] { background: #666; }\n.gcell[data-col="2"] { background: #ec2; }\n.gcell[data-col="3"] { background: #2a2; }\n\n'));
            Ia(z.wd || "", z.wc);
            window.addEventListener("keypress", function (e) {
                "INPUT" != e.target.tagName && "TEXTAREA" != e.target.tagName && e.key && Z(e.key.toUpperCase())
            });
            window.addEventListener("keydown", function (e) {
                "INPUT" != e.target.tagName && "TEXTAREA" != e.target.tagName && "Backspace" == e.key && Z("<")
            });
            Ka();
            var c = b = 0;
            xa && (c = /Android/.test(a) ? 1 : 2);
            try {
                window.matchMedia("(display-mode: standalone)").matches ? b = 1 : window.navigator.standalone && (b = 2)
            } catch (e) {
            }
            N({tp: "vis", wd: z.wd, wc: z.wc, ref: document.referrer, mob: c, dmst: b})
        }
    }
})();
