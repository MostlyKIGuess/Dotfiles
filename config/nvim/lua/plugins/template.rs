#![allow(unused_variables)]
#![allow(unused_must_use)]
use std::collections::{BinaryHeap, HashMap, HashSet, VecDeque};
use std::io::{self, BufRead};

type Int = i64;
type Uint = u64;
type Float = f64;
type Str = String;
type Vec2d<T> = Vec<Vec<T>>;

const MOD: Int = 1_000_000_007;
const INF: Int = 1_000_000_000_000_000_000;

fn read_int() -> Int {
    let mut input = String::new();
    io::stdin().lock().read_line(&mut input).unwrap();
    input.trim().parse().unwrap()
}

fn read_string() -> String {
    let mut input = String::new();
    io::stdin().lock().read_line(&mut input).unwrap();
    input.trim().to_string()
}

fn read_line<T: std::str::FromStr>() -> T {
    let mut input = String::new();
    io::stdin().lock().read_line(&mut input).unwrap();
    input.trim().parse().ok().unwrap()
}

fn read_vec<T: std::str::FromStr>() -> Vec<T> {
    let mut input = String::new();
    io::stdin().lock().read_line(&mut input).unwrap();
    input
        .trim()
        .split_whitespace()
        .map(|x| x.parse().ok().unwrap())
        .collect()
}

fn mygcd(a: Int, b: Int) -> Int {
    if b == 0 {
        a
    } else {
        gcd(b, a % b)
    }
}

fn mylcm(a: Int, b: Int) -> Int {
    a / gcd(a, b) * b
}
fn mysqrt(num: i64) -> i64 {
    if num <= 1 {
        return num;
    }
    let mut l = 1;
    let mut h = 10000000000;
    let mut ans = 0;
    while l <= h {
        let mid = l + (h - l) >> 1;
        let mid_sq = mid * mid;
        if mid_sq == num {
            return mid;
        } else if mid_sq < num {
            ans = mid;
            l = mid + 1;
        } else {
            h = mid - 1;
        }
    }
    return ans;
}

fn solve() {}

fn main() {
    let t: Int = read_int();

    for _ in 0..t {
        solve();
    }
}
