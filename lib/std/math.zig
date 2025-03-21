const builtin = @import("builtin");
const std = @import("std.zig");
const assert = std.debug.assert;
const mem = std.mem;
const testing = std.testing;

/// Euler's number (e)
pub const e = 2.71828182845904523536028747135266249775724709369995;

/// Archimedes' constant (π)
pub const pi = 3.14159265358979323846264338327950288419716939937510;

/// Phi or Golden ratio constant (Φ) = (1 + sqrt(5))/2
pub const phi = 1.6180339887498948482045868343656381177203091798057628621;

/// Circle constant (τ)
pub const tau = 2 * pi;

/// log2(e)
pub const log2e = 1.442695040888963407359924681001892137;

/// log10(e)
pub const log10e = 0.434294481903251827651128918916605082;

/// ln(2)
pub const ln2 = 0.693147180559945309417232121458176568;

/// ln(10)
pub const ln10 = 2.302585092994045684017991454684364208;

/// 2/sqrt(π)
pub const two_sqrtpi = 1.128379167095512573896158903121545172;

/// sqrt(2)
pub const sqrt2 = 1.414213562373095048801688724209698079;

/// 1/sqrt(2)
pub const sqrt1_2 = 0.707106781186547524400844362104849039;

pub const floatExponentBits = @import("math/float.zig").floatExponentBits;
pub const floatMantissaBits = @import("math/float.zig").floatMantissaBits;
pub const floatFractionalBits = @import("math/float.zig").floatFractionalBits;
pub const floatExponentMin = @import("math/float.zig").floatExponentMin;
pub const floatExponentMax = @import("math/float.zig").floatExponentMax;
pub const floatTrueMin = @import("math/float.zig").floatTrueMin;
pub const floatMin = @import("math/float.zig").floatMin;
pub const floatMax = @import("math/float.zig").floatMax;
pub const floatEps = @import("math/float.zig").floatEps;
pub const inf = @import("math/float.zig").inf;

// TODO Replace with @compileError("deprecated for foobar") after 0.10.0 is released.
pub const f16_true_min: comptime_float = floatTrueMin(f16); // prev: 0.000000059604644775390625
pub const f32_true_min: comptime_float = floatTrueMin(f32); // prev: 1.40129846432481707092e-45
pub const f64_true_min: comptime_float = floatTrueMin(f64); // prev: 4.94065645841246544177e-324
pub const f80_true_min = floatTrueMin(f80); // prev: make_f80(.{ .fraction = 1, .exp = 0 })
pub const f128_true_min = floatTrueMin(f128); // prev: @bitCast(f128, @as(u128, 0x00000000000000000000000000000001))
pub const f16_min: comptime_float = floatMin(f16); // prev: 0.00006103515625
pub const f32_min: comptime_float = floatMin(f32); // prev: 1.17549435082228750797e-38
pub const f64_min: comptime_float = floatMin(f64); // prev: 2.2250738585072014e-308
pub const f80_min = floatMin(f80); // prev: make_f80(.{ .fraction = 0x8000000000000000, .exp = 1 })
pub const f128_min = floatMin(f128); // prev: @bitCast(f128, @as(u128, 0x00010000000000000000000000000000))
pub const f16_max: comptime_float = floatMax(f16); // prev: 65504
pub const f32_max: comptime_float = floatMax(f32); // prev: 3.40282346638528859812e+38
pub const f64_max: comptime_float = floatMax(f64); // prev: 1.79769313486231570815e+308
pub const f80_max = floatMax(f80); // prev: make_f80(.{ .fraction = 0xFFFFFFFFFFFFFFFF, .exp = 0x7FFE })
pub const f128_max = floatMax(f128); // prev: @bitCast(f128, @as(u128, 0x7FFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
pub const f16_epsilon: comptime_float = floatEps(f16); // prev: 0.0009765625
pub const f32_epsilon: comptime_float = floatEps(f32); // prev: 1.1920928955078125e-07
pub const f64_epsilon: comptime_float = floatEps(f64); // prev: 2.22044604925031308085e-16
pub const f80_epsilon = floatEps(f80); // prev: make_f80(.{ .fraction = 0x8000000000000000, .exp = 0x3FC0 })
pub const f128_epsilon = floatEps(f128); // prev: @bitCast(f128, @as(u128, 0x3F8F0000000000000000000000000000))
pub const f16_toint: comptime_float = 1.0 / f16_epsilon; // same as before
pub const f32_toint: comptime_float = 1.0 / f32_epsilon; // same as before
pub const f64_toint: comptime_float = 1.0 / f64_epsilon; // same as before
pub const f80_toint = 1.0 / f80_epsilon; // same as before
pub const f128_toint = 1.0 / f128_epsilon; // same as before
pub const inf_u16 = @bitCast(u16, inf_f16); // prev: @as(u16, 0x7C00)
pub const inf_f16 = inf(f16); // prev: @bitCast(f16, inf_u16)
pub const inf_u32 = @bitCast(u32, inf_f32); // prev: @as(u32, 0x7F800000)
pub const inf_f32 = inf(f32); // prev: @bitCast(f32, inf_u32)
pub const inf_u64 = @bitCast(u64, inf_f64); // prev: @as(u64, 0x7FF << 52)
pub const inf_f64 = inf(f64); // prev: @bitCast(f64, inf_u64)
pub const inf_f80 = inf(f80); // prev: make_f80(F80{ .fraction = 0x8000000000000000, .exp = 0x7fff })
pub const inf_u128 = @bitCast(u128, inf_f128); // prev: @as(u128, 0x7fff0000000000000000000000000000)
pub const inf_f128 = inf(f128); // prev: @bitCast(f128, inf_u128)
pub const epsilon = floatEps;
// End of "soft deprecated" section

pub const nan_u16 = @as(u16, 0x7C01);
pub const nan_f16 = @bitCast(f16, nan_u16);

pub const qnan_u16 = @as(u16, 0x7E00);
pub const qnan_f16 = @bitCast(f16, qnan_u16);

pub const nan_u32 = @as(u32, 0x7F800001);
pub const nan_f32 = @bitCast(f32, nan_u32);

pub const qnan_u32 = @as(u32, 0x7FC00000);
pub const qnan_f32 = @bitCast(f32, qnan_u32);

pub const nan_u64 = @as(u64, 0x7FF << 52) | 1;
pub const nan_f64 = @bitCast(f64, nan_u64);

pub const qnan_u64 = @as(u64, 0x7ff8000000000000);
pub const qnan_f64 = @bitCast(f64, qnan_u64);

pub const nan_f80 = make_f80(F80{ .fraction = 0xA000000000000000, .exp = 0x7fff });
pub const qnan_f80 = make_f80(F80{ .fraction = 0xC000000000000000, .exp = 0x7fff });

pub const nan_u128 = @as(u128, 0x7fff0000000000000000000000000001);
pub const nan_f128 = @bitCast(f128, nan_u128);

pub const qnan_u128 = @as(u128, 0x7fff8000000000000000000000000000);
pub const qnan_f128 = @bitCast(f128, qnan_u128);

pub const nan = @import("math/nan.zig").nan;
pub const snan = @import("math/nan.zig").snan;

/// Performs an approximate comparison of two floating point values `x` and `y`.
/// Returns true if the absolute difference between them is less or equal than
/// the specified tolerance.
///
/// The `tolerance` parameter is the absolute tolerance used when determining if
/// the two numbers are close enough; a good value for this parameter is a small
/// multiple of `floatEps(T)`.
///
/// Note that this function is recommended for comparing small numbers
/// around zero; using `approxEqRel` is suggested otherwise.
///
/// NaN values are never considered equal to any value.
pub fn approxEqAbs(comptime T: type, x: T, y: T, tolerance: T) bool {
    assert(@typeInfo(T) == .Float);
    assert(tolerance >= 0);

    // Fast path for equal values (and signed zeros and infinites).
    if (x == y)
        return true;

    if (isNan(x) or isNan(y))
        return false;

    return @fabs(x - y) <= tolerance;
}

/// Performs an approximate comparison of two floating point values `x` and `y`.
/// Returns true if the absolute difference between them is less or equal than
/// `max(|x|, |y|) * tolerance`, where `tolerance` is a positive number greater
/// than zero.
///
/// The `tolerance` parameter is the relative tolerance used when determining if
/// the two numbers are close enough; a good value for this parameter is usually
/// `sqrt(floatEps(T))`, meaning that the two numbers are considered equal if at
/// least half of the digits are equal.
///
/// Note that for comparisons of small numbers around zero this function won't
/// give meaningful results, use `approxEqAbs` instead.
///
/// NaN values are never considered equal to any value.
pub fn approxEqRel(comptime T: type, x: T, y: T, tolerance: T) bool {
    assert(@typeInfo(T) == .Float);
    assert(tolerance > 0);

    // Fast path for equal values (and signed zeros and infinites).
    if (x == y)
        return true;

    if (isNan(x) or isNan(y))
        return false;

    return @fabs(x - y) <= max(@fabs(x), @fabs(y)) * tolerance;
}

pub fn approxEq(comptime T: type, x: T, y: T, tolerance: T) bool {
    _ = T;
    _ = x;
    _ = y;
    _ = tolerance;
    @compileError("deprecated; use `approxEqAbs` or `approxEqRel`");
}

test "approxEqAbs and approxEqRel" {
    inline for ([_]type{ f16, f32, f64, f128 }) |T| {
        const eps_value = comptime floatEps(T);
        const sqrt_eps_value = comptime sqrt(eps_value);
        const nan_value = comptime nan(T);
        const inf_value = comptime inf(T);
        const min_value = comptime floatMin(T);

        try testing.expect(approxEqAbs(T, 0.0, 0.0, eps_value));
        try testing.expect(approxEqAbs(T, -0.0, -0.0, eps_value));
        try testing.expect(approxEqAbs(T, 0.0, -0.0, eps_value));
        try testing.expect(approxEqRel(T, 1.0, 1.0, sqrt_eps_value));
        try testing.expect(!approxEqRel(T, 1.0, 0.0, sqrt_eps_value));
        try testing.expect(!approxEqAbs(T, 1.0 + 2 * eps_value, 1.0, eps_value));
        try testing.expect(approxEqAbs(T, 1.0 + 1 * eps_value, 1.0, eps_value));
        try testing.expect(!approxEqRel(T, 1.0, nan_value, sqrt_eps_value));
        try testing.expect(!approxEqRel(T, nan_value, nan_value, sqrt_eps_value));
        try testing.expect(approxEqRel(T, inf_value, inf_value, sqrt_eps_value));
        try testing.expect(approxEqRel(T, min_value, min_value, sqrt_eps_value));
        try testing.expect(approxEqRel(T, -min_value, -min_value, sqrt_eps_value));
        try testing.expect(approxEqAbs(T, min_value, 0.0, eps_value * 2));
        try testing.expect(approxEqAbs(T, -min_value, 0.0, eps_value * 2));
    }
}

pub fn doNotOptimizeAway(value: anytype) void {
    // TODO: use @declareSideEffect() when it is available.
    // https://github.com/ziglang/zig/issues/6168
    const T = @TypeOf(value);
    var x: T = undefined;
    const p = @ptrCast(*volatile T, &x);
    p.* = x;
}

pub fn raiseInvalid() void {
    // Raise INVALID fpu exception
}

pub fn raiseUnderflow() void {
    // Raise UNDERFLOW fpu exception
}

pub fn raiseOverflow() void {
    // Raise OVERFLOW fpu exception
}

pub fn raiseInexact() void {
    // Raise INEXACT fpu exception
}

pub fn raiseDivByZero() void {
    // Raise INEXACT fpu exception
}

pub const isNan = @import("math/isnan.zig").isNan;
pub const isSignalNan = @import("math/isnan.zig").isSignalNan;
pub const frexp = @import("math/frexp.zig").frexp;
pub const Frexp = @import("math/frexp.zig").Frexp;
pub const modf = @import("math/modf.zig").modf;
pub const modf32_result = @import("math/modf.zig").modf32_result;
pub const modf64_result = @import("math/modf.zig").modf64_result;
pub const copysign = @import("math/copysign.zig").copysign;
pub const isFinite = @import("math/isfinite.zig").isFinite;
pub const isInf = @import("math/isinf.zig").isInf;
pub const isPositiveInf = @import("math/isinf.zig").isPositiveInf;
pub const isNegativeInf = @import("math/isinf.zig").isNegativeInf;
pub const isNormal = @import("math/isnormal.zig").isNormal;
pub const signbit = @import("math/signbit.zig").signbit;
pub const scalbn = @import("math/scalbn.zig").scalbn;
pub const ldexp = @import("math/ldexp.zig").ldexp;
pub const pow = @import("math/pow.zig").pow;
pub const powi = @import("math/powi.zig").powi;
pub const sqrt = @import("math/sqrt.zig").sqrt;
pub const cbrt = @import("math/cbrt.zig").cbrt;
pub const acos = @import("math/acos.zig").acos;
pub const asin = @import("math/asin.zig").asin;
pub const atan = @import("math/atan.zig").atan;
pub const atan2 = @import("math/atan2.zig").atan2;
pub const hypot = @import("math/hypot.zig").hypot;
pub const expm1 = @import("math/expm1.zig").expm1;
pub const ilogb = @import("math/ilogb.zig").ilogb;
pub const ln = @import("math/ln.zig").ln;
pub const log = @import("math/log.zig").log;
pub const log2 = @import("math/log2.zig").log2;
pub const log10 = @import("math/log10.zig").log10;
pub const log1p = @import("math/log1p.zig").log1p;
pub const asinh = @import("math/asinh.zig").asinh;
pub const acosh = @import("math/acosh.zig").acosh;
pub const atanh = @import("math/atanh.zig").atanh;
pub const sinh = @import("math/sinh.zig").sinh;
pub const cosh = @import("math/cosh.zig").cosh;
pub const tanh = @import("math/tanh.zig").tanh;

/// Sine trigonometric function on a floating point number.
/// Uses a dedicated hardware instruction when available.
/// This is the same as calling the builtin @sin
pub inline fn sin(value: anytype) @TypeOf(value) {
    return @sin(value);
}

/// Cosine trigonometric function on a floating point number.
/// Uses a dedicated hardware instruction when available.
/// This is the same as calling the builtin @cos
pub inline fn cos(value: anytype) @TypeOf(value) {
    return @cos(value);
}

/// Tangent trigonometric function on a floating point number.
/// Uses a dedicated hardware instruction when available.
/// This is the same as calling the builtin @tan
pub inline fn tan(value: anytype) @TypeOf(value) {
    return @tan(value);
}

// Convert an angle in radians to degrees. T must be a float type.
pub fn radiansToDegrees(comptime T: type, angle_in_radians: T) T {
    if (@typeInfo(T) != .Float)
        @compileError("T must be a float type.");
    return angle_in_radians * 180.0 / pi;
}

test "radiansToDegrees" {
    try std.testing.expectApproxEqAbs(@as(f32, 0), radiansToDegrees(f32, 0), 1e-6);
    try std.testing.expectApproxEqAbs(@as(f32, 90), radiansToDegrees(f32, pi / 2.0), 1e-6);
    try std.testing.expectApproxEqAbs(@as(f32, -45), radiansToDegrees(f32, -pi / 4.0), 1e-6);
    try std.testing.expectApproxEqAbs(@as(f32, 180), radiansToDegrees(f32, pi), 1e-6);
    try std.testing.expectApproxEqAbs(@as(f32, 360), radiansToDegrees(f32, 2.0 * pi), 1e-6);
}

// Convert an angle in degrees to radians. T must be a float type.
pub fn degreesToRadians(comptime T: type, angle_in_degrees: T) T {
    if (@typeInfo(T) != .Float)
        @compileError("T must be a float type.");
    return angle_in_degrees * pi / 180.0;
}

test "degreesToRadians" {
    try std.testing.expectApproxEqAbs(@as(f32, pi / 2.0), degreesToRadians(f32, 90), 1e-6);
    try std.testing.expectApproxEqAbs(@as(f32, -3 * pi / 2.0), degreesToRadians(f32, -270), 1e-6);
    try std.testing.expectApproxEqAbs(@as(f32, 2 * pi), degreesToRadians(f32, 360), 1e-6);
}

/// Base-e exponential function on a floating point number.
/// Uses a dedicated hardware instruction when available.
/// This is the same as calling the builtin @exp
pub inline fn exp(value: anytype) @TypeOf(value) {
    return @exp(value);
}

/// Base-2 exponential function on a floating point number.
/// Uses a dedicated hardware instruction when available.
/// This is the same as calling the builtin @exp2
pub inline fn exp2(value: anytype) @TypeOf(value) {
    return @exp2(value);
}

pub const complex = @import("math/complex.zig");
pub const Complex = complex.Complex;

pub const big = @import("math/big.zig");

test {
    std.testing.refAllDecls(@This());
}

/// Given two types, returns the smallest one which is capable of holding the
/// full range of the minimum value.
pub fn Min(comptime A: type, comptime B: type) type {
    switch (@typeInfo(A)) {
        .Int => |a_info| switch (@typeInfo(B)) {
            .Int => |b_info| if (a_info.signedness == .unsigned and b_info.signedness == .unsigned) {
                if (a_info.bits < b_info.bits) {
                    return A;
                } else {
                    return B;
                }
            },
            else => {},
        },
        else => {},
    }
    return @TypeOf(@as(A, 0) + @as(B, 0));
}

/// Returns the smaller number. When one parameter's type's full range
/// fits in the other, the return type is the smaller type.
pub fn min(x: anytype, y: anytype) Min(@TypeOf(x), @TypeOf(y)) {
    const Result = Min(@TypeOf(x), @TypeOf(y));
    if (x < y) {
        // TODO Zig should allow this as an implicit cast because x is
        // immutable and in this scope it is known to fit in the
        // return type.
        switch (@typeInfo(Result)) {
            .Int => return @intCast(Result, x),
            else => return x,
        }
    } else {
        // TODO Zig should allow this as an implicit cast because y is
        // immutable and in this scope it is known to fit in the
        // return type.
        switch (@typeInfo(Result)) {
            .Int => return @intCast(Result, y),
            else => return y,
        }
    }
}

test "min" {
    try testing.expect(min(@as(i32, -1), @as(i32, 2)) == -1);
    {
        var a: u16 = 999;
        var b: u32 = 10;
        var result = min(a, b);
        try testing.expect(@TypeOf(result) == u16);
        try testing.expect(result == 10);
    }
    {
        var a: f64 = 10.34;
        var b: f32 = 999.12;
        var result = min(a, b);
        try testing.expect(@TypeOf(result) == f64);
        try testing.expect(result == 10.34);
    }
    {
        var a: i8 = -127;
        var b: i16 = -200;
        var result = min(a, b);
        try testing.expect(@TypeOf(result) == i16);
        try testing.expect(result == -200);
    }
    {
        const a = 10.34;
        var b: f32 = 999.12;
        var result = min(a, b);
        try testing.expect(@TypeOf(result) == f32);
        try testing.expect(result == 10.34);
    }
}

/// Finds the minimum of three numbers.
pub fn min3(x: anytype, y: anytype, z: anytype) @TypeOf(x, y, z) {
    return min(x, min(y, z));
}

test "min3" {
    try testing.expect(min3(@as(i32, 0), @as(i32, 1), @as(i32, 2)) == 0);
    try testing.expect(min3(@as(i32, 0), @as(i32, 2), @as(i32, 1)) == 0);
    try testing.expect(min3(@as(i32, 1), @as(i32, 0), @as(i32, 2)) == 0);
    try testing.expect(min3(@as(i32, 1), @as(i32, 2), @as(i32, 0)) == 0);
    try testing.expect(min3(@as(i32, 2), @as(i32, 0), @as(i32, 1)) == 0);
    try testing.expect(min3(@as(i32, 2), @as(i32, 1), @as(i32, 0)) == 0);
}

/// Returns the maximum of two numbers. Return type is the one with the
/// larger range.
pub fn max(x: anytype, y: anytype) @TypeOf(x, y) {
    return if (x > y) x else y;
}

test "max" {
    try testing.expect(max(@as(i32, -1), @as(i32, 2)) == 2);
    try testing.expect(max(@as(i32, 2), @as(i32, -1)) == 2);
}

/// Finds the maximum of three numbers.
pub fn max3(x: anytype, y: anytype, z: anytype) @TypeOf(x, y, z) {
    return max(x, max(y, z));
}

test "max3" {
    try testing.expect(max3(@as(i32, 0), @as(i32, 1), @as(i32, 2)) == 2);
    try testing.expect(max3(@as(i32, 0), @as(i32, 2), @as(i32, 1)) == 2);
    try testing.expect(max3(@as(i32, 1), @as(i32, 0), @as(i32, 2)) == 2);
    try testing.expect(max3(@as(i32, 1), @as(i32, 2), @as(i32, 0)) == 2);
    try testing.expect(max3(@as(i32, 2), @as(i32, 0), @as(i32, 1)) == 2);
    try testing.expect(max3(@as(i32, 2), @as(i32, 1), @as(i32, 0)) == 2);
}

/// Limit val to the inclusive range [lower, upper].
pub fn clamp(val: anytype, lower: anytype, upper: anytype) @TypeOf(val, lower, upper) {
    assert(lower <= upper);
    return max(lower, min(val, upper));
}
test "clamp" {
    // Within range
    try testing.expect(std.math.clamp(@as(i32, -1), @as(i32, -4), @as(i32, 7)) == -1);
    // Below
    try testing.expect(std.math.clamp(@as(i32, -5), @as(i32, -4), @as(i32, 7)) == -4);
    // Above
    try testing.expect(std.math.clamp(@as(i32, 8), @as(i32, -4), @as(i32, 7)) == 7);

    // Floating point
    try testing.expect(std.math.clamp(@as(f32, 1.1), @as(f32, 0.0), @as(f32, 1.0)) == 1.0);
    try testing.expect(std.math.clamp(@as(f32, -127.5), @as(f32, -200), @as(f32, -100)) == -127.5);

    // Mix of comptime and non-comptime
    var i: i32 = 1;
    try testing.expect(std.math.clamp(i, 0, 1) == 1);
}

/// Returns the product of a and b. Returns an error on overflow.
pub fn mul(comptime T: type, a: T, b: T) (error{Overflow}!T) {
    var answer: T = undefined;
    return if (@mulWithOverflow(T, a, b, &answer)) error.Overflow else answer;
}

/// Returns the sum of a and b. Returns an error on overflow.
pub fn add(comptime T: type, a: T, b: T) (error{Overflow}!T) {
    if (T == comptime_int) return a + b;
    var answer: T = undefined;
    return if (@addWithOverflow(T, a, b, &answer)) error.Overflow else answer;
}

/// Returns a - b, or an error on overflow.
pub fn sub(comptime T: type, a: T, b: T) (error{Overflow}!T) {
    var answer: T = undefined;
    return if (@subWithOverflow(T, a, b, &answer)) error.Overflow else answer;
}

pub fn negate(x: anytype) !@TypeOf(x) {
    return sub(@TypeOf(x), 0, x);
}

/// Shifts a left by shift_amt. Returns an error on overflow. shift_amt
/// is unsigned.
pub fn shlExact(comptime T: type, a: T, shift_amt: Log2Int(T)) !T {
    var answer: T = undefined;
    return if (@shlWithOverflow(T, a, shift_amt, &answer)) error.Overflow else answer;
}

/// Shifts left. Overflowed bits are truncated.
/// A negative shift amount results in a right shift.
pub fn shl(comptime T: type, a: T, shift_amt: anytype) T {
    const abs_shift_amt = absCast(shift_amt);

    const casted_shift_amt = blk: {
        if (@typeInfo(T) == .Vector) {
            const C = @typeInfo(T).Vector.child;
            const len = @typeInfo(T).Vector.len;
            if (abs_shift_amt >= @typeInfo(C).Int.bits) return @splat(len, @as(C, 0));
            break :blk @splat(len, @intCast(Log2Int(C), abs_shift_amt));
        } else {
            if (abs_shift_amt >= @typeInfo(T).Int.bits) return 0;
            break :blk @intCast(Log2Int(T), abs_shift_amt);
        }
    };

    if (@TypeOf(shift_amt) == comptime_int or @typeInfo(@TypeOf(shift_amt)).Int.signedness == .signed) {
        if (shift_amt < 0) {
            return a >> casted_shift_amt;
        }
    }

    return a << casted_shift_amt;
}

test "shl" {
    if ((builtin.zig_backend == .stage1 or builtin.zig_backend == .stage2_llvm) and
        builtin.cpu.arch == .aarch64)
    {
        // https://github.com/ziglang/zig/issues/12012
        return error.SkipZigTest;
    }
    try testing.expect(shl(u8, 0b11111111, @as(usize, 3)) == 0b11111000);
    try testing.expect(shl(u8, 0b11111111, @as(usize, 8)) == 0);
    try testing.expect(shl(u8, 0b11111111, @as(usize, 9)) == 0);
    try testing.expect(shl(u8, 0b11111111, @as(isize, -2)) == 0b00111111);
    try testing.expect(shl(u8, 0b11111111, 3) == 0b11111000);
    try testing.expect(shl(u8, 0b11111111, 8) == 0);
    try testing.expect(shl(u8, 0b11111111, 9) == 0);
    try testing.expect(shl(u8, 0b11111111, -2) == 0b00111111);
    try testing.expect(shl(@Vector(1, u32), @Vector(1, u32){42}, @as(usize, 1))[0] == @as(u32, 42) << 1);
    try testing.expect(shl(@Vector(1, u32), @Vector(1, u32){42}, @as(isize, -1))[0] == @as(u32, 42) >> 1);
    try testing.expect(shl(@Vector(1, u32), @Vector(1, u32){42}, 33)[0] == 0);
}

/// Shifts right. Overflowed bits are truncated.
/// A negative shift amount results in a left shift.
pub fn shr(comptime T: type, a: T, shift_amt: anytype) T {
    const abs_shift_amt = absCast(shift_amt);

    const casted_shift_amt = blk: {
        if (@typeInfo(T) == .Vector) {
            const C = @typeInfo(T).Vector.child;
            const len = @typeInfo(T).Vector.len;
            if (abs_shift_amt >= @typeInfo(C).Int.bits) return @splat(len, @as(C, 0));
            break :blk @splat(len, @intCast(Log2Int(C), abs_shift_amt));
        } else {
            if (abs_shift_amt >= @typeInfo(T).Int.bits) return 0;
            break :blk @intCast(Log2Int(T), abs_shift_amt);
        }
    };

    if (@TypeOf(shift_amt) == comptime_int or @typeInfo(@TypeOf(shift_amt)).Int.signedness == .signed) {
        if (shift_amt < 0) {
            return a << casted_shift_amt;
        }
    }

    return a >> casted_shift_amt;
}

test "shr" {
    if ((builtin.zig_backend == .stage1 or builtin.zig_backend == .stage2_llvm) and
        builtin.cpu.arch == .aarch64)
    {
        // https://github.com/ziglang/zig/issues/12012
        return error.SkipZigTest;
    }
    try testing.expect(shr(u8, 0b11111111, @as(usize, 3)) == 0b00011111);
    try testing.expect(shr(u8, 0b11111111, @as(usize, 8)) == 0);
    try testing.expect(shr(u8, 0b11111111, @as(usize, 9)) == 0);
    try testing.expect(shr(u8, 0b11111111, @as(isize, -2)) == 0b11111100);
    try testing.expect(shr(u8, 0b11111111, 3) == 0b00011111);
    try testing.expect(shr(u8, 0b11111111, 8) == 0);
    try testing.expect(shr(u8, 0b11111111, 9) == 0);
    try testing.expect(shr(u8, 0b11111111, -2) == 0b11111100);
    try testing.expect(shr(@Vector(1, u32), @Vector(1, u32){42}, @as(usize, 1))[0] == @as(u32, 42) >> 1);
    try testing.expect(shr(@Vector(1, u32), @Vector(1, u32){42}, @as(isize, -1))[0] == @as(u32, 42) << 1);
    try testing.expect(shr(@Vector(1, u32), @Vector(1, u32){42}, 33)[0] == 0);
}

/// Rotates right. Only unsigned values can be rotated.  Negative shift
/// values result in shift modulo the bit count.
pub fn rotr(comptime T: type, x: T, r: anytype) T {
    if (@typeInfo(T) == .Vector) {
        const C = @typeInfo(T).Vector.child;
        if (@typeInfo(C).Int.signedness == .signed) {
            @compileError("cannot rotate signed integers");
        }
        const ar = @intCast(Log2Int(C), @mod(r, @typeInfo(C).Int.bits));
        return (x >> @splat(@typeInfo(T).Vector.len, ar)) | (x << @splat(@typeInfo(T).Vector.len, 1 + ~ar));
    } else if (@typeInfo(T).Int.signedness == .signed) {
        @compileError("cannot rotate signed integer");
    } else {
        const ar = @intCast(Log2Int(T), @mod(r, @typeInfo(T).Int.bits));
        return x >> ar | x << (1 +% ~ar);
    }
}

test "rotr" {
    if ((builtin.zig_backend == .stage1 or builtin.zig_backend == .stage2_llvm) and
        builtin.cpu.arch == .aarch64)
    {
        // https://github.com/ziglang/zig/issues/12012
        return error.SkipZigTest;
    }
    try testing.expect(rotr(u8, 0b00000001, @as(usize, 0)) == 0b00000001);
    try testing.expect(rotr(u8, 0b00000001, @as(usize, 9)) == 0b10000000);
    try testing.expect(rotr(u8, 0b00000001, @as(usize, 8)) == 0b00000001);
    try testing.expect(rotr(u8, 0b00000001, @as(usize, 4)) == 0b00010000);
    try testing.expect(rotr(u8, 0b00000001, @as(isize, -1)) == 0b00000010);
    try testing.expect(rotr(@Vector(1, u32), @Vector(1, u32){1}, @as(usize, 1))[0] == @as(u32, 1) << 31);
    try testing.expect(rotr(@Vector(1, u32), @Vector(1, u32){1}, @as(isize, -1))[0] == @as(u32, 1) << 1);
}

/// Rotates left. Only unsigned values can be rotated.  Negative shift
/// values result in shift modulo the bit count.
pub fn rotl(comptime T: type, x: T, r: anytype) T {
    if (@typeInfo(T) == .Vector) {
        const C = @typeInfo(T).Vector.child;
        if (@typeInfo(C).Int.signedness == .signed) {
            @compileError("cannot rotate signed integers");
        }
        const ar = @intCast(Log2Int(C), @mod(r, @typeInfo(C).Int.bits));
        return (x << @splat(@typeInfo(T).Vector.len, ar)) | (x >> @splat(@typeInfo(T).Vector.len, 1 +% ~ar));
    } else if (@typeInfo(T).Int.signedness == .signed) {
        @compileError("cannot rotate signed integer");
    } else {
        const ar = @intCast(Log2Int(T), @mod(r, @typeInfo(T).Int.bits));
        return x << ar | x >> 1 +% ~ar;
    }
}

test "rotl" {
    if ((builtin.zig_backend == .stage1 or builtin.zig_backend == .stage2_llvm) and
        builtin.cpu.arch == .aarch64)
    {
        // https://github.com/ziglang/zig/issues/12012
        return error.SkipZigTest;
    }
    try testing.expect(rotl(u8, 0b00000001, @as(usize, 0)) == 0b00000001);
    try testing.expect(rotl(u8, 0b00000001, @as(usize, 9)) == 0b00000010);
    try testing.expect(rotl(u8, 0b00000001, @as(usize, 8)) == 0b00000001);
    try testing.expect(rotl(u8, 0b00000001, @as(usize, 4)) == 0b00010000);
    try testing.expect(rotl(u8, 0b00000001, @as(isize, -1)) == 0b10000000);
    try testing.expect(rotl(@Vector(1, u32), @Vector(1, u32){1 << 31}, @as(usize, 1))[0] == 1);
    try testing.expect(rotl(@Vector(1, u32), @Vector(1, u32){1 << 31}, @as(isize, -1))[0] == @as(u32, 1) << 30);
}

/// Returns an unsigned int type that can hold the number of bits in T
/// - 1. Suitable for 0-based bit indices of T.
pub fn Log2Int(comptime T: type) type {
    // comptime ceil log2
    comptime var count = 0;
    comptime var s = @typeInfo(T).Int.bits - 1;
    inline while (s != 0) : (s >>= 1) {
        count += 1;
    }

    return std.meta.Int(.unsigned, count);
}

/// Returns an unsigned int type that can hold the number of bits in T.
pub fn Log2IntCeil(comptime T: type) type {
    // comptime ceil log2
    comptime var count = 0;
    comptime var s = @typeInfo(T).Int.bits;
    inline while (s != 0) : (s >>= 1) {
        count += 1;
    }

    return std.meta.Int(.unsigned, count);
}

/// Returns the smallest integer type that can hold both from and to.
pub fn IntFittingRange(comptime from: comptime_int, comptime to: comptime_int) type {
    assert(from <= to);
    if (from == 0 and to == 0) {
        return u0;
    }
    const signedness: std.builtin.Signedness = if (from < 0) .signed else .unsigned;
    const largest_positive_integer = max(if (from < 0) (-from) - 1 else from, to); // two's complement
    const base = log2(largest_positive_integer);
    const upper = (1 << base) - 1;
    var magnitude_bits = if (upper >= largest_positive_integer) base else base + 1;
    if (signedness == .signed) {
        magnitude_bits += 1;
    }
    return std.meta.Int(signedness, magnitude_bits);
}

test "IntFittingRange" {
    try testing.expect(IntFittingRange(0, 0) == u0);
    try testing.expect(IntFittingRange(0, 1) == u1);
    try testing.expect(IntFittingRange(0, 2) == u2);
    try testing.expect(IntFittingRange(0, 3) == u2);
    try testing.expect(IntFittingRange(0, 4) == u3);
    try testing.expect(IntFittingRange(0, 7) == u3);
    try testing.expect(IntFittingRange(0, 8) == u4);
    try testing.expect(IntFittingRange(0, 9) == u4);
    try testing.expect(IntFittingRange(0, 15) == u4);
    try testing.expect(IntFittingRange(0, 16) == u5);
    try testing.expect(IntFittingRange(0, 17) == u5);
    try testing.expect(IntFittingRange(0, 4095) == u12);
    try testing.expect(IntFittingRange(2000, 4095) == u12);
    try testing.expect(IntFittingRange(0, 4096) == u13);
    try testing.expect(IntFittingRange(2000, 4096) == u13);
    try testing.expect(IntFittingRange(0, 4097) == u13);
    try testing.expect(IntFittingRange(2000, 4097) == u13);
    try testing.expect(IntFittingRange(0, 123456789123456798123456789) == u87);
    try testing.expect(IntFittingRange(0, 123456789123456798123456789123456789123456798123456789) == u177);

    try testing.expect(IntFittingRange(-1, -1) == i1);
    try testing.expect(IntFittingRange(-1, 0) == i1);
    try testing.expect(IntFittingRange(-1, 1) == i2);
    try testing.expect(IntFittingRange(-2, -2) == i2);
    try testing.expect(IntFittingRange(-2, -1) == i2);
    try testing.expect(IntFittingRange(-2, 0) == i2);
    try testing.expect(IntFittingRange(-2, 1) == i2);
    try testing.expect(IntFittingRange(-2, 2) == i3);
    try testing.expect(IntFittingRange(-1, 2) == i3);
    try testing.expect(IntFittingRange(-1, 3) == i3);
    try testing.expect(IntFittingRange(-1, 4) == i4);
    try testing.expect(IntFittingRange(-1, 7) == i4);
    try testing.expect(IntFittingRange(-1, 8) == i5);
    try testing.expect(IntFittingRange(-1, 9) == i5);
    try testing.expect(IntFittingRange(-1, 15) == i5);
    try testing.expect(IntFittingRange(-1, 16) == i6);
    try testing.expect(IntFittingRange(-1, 17) == i6);
    try testing.expect(IntFittingRange(-1, 4095) == i13);
    try testing.expect(IntFittingRange(-4096, 4095) == i13);
    try testing.expect(IntFittingRange(-1, 4096) == i14);
    try testing.expect(IntFittingRange(-4097, 4095) == i14);
    try testing.expect(IntFittingRange(-1, 4097) == i14);
    try testing.expect(IntFittingRange(-1, 123456789123456798123456789) == i88);
    try testing.expect(IntFittingRange(-1, 123456789123456798123456789123456789123456798123456789) == i178);
}

test "overflow functions" {
    try testOverflow();
    comptime try testOverflow();
}

fn testOverflow() !void {
    try testing.expect((mul(i32, 3, 4) catch unreachable) == 12);
    try testing.expect((add(i32, 3, 4) catch unreachable) == 7);
    try testing.expect((sub(i32, 3, 4) catch unreachable) == -1);
    try testing.expect((shlExact(i32, 0b11, 4) catch unreachable) == 0b110000);
}

/// Returns the absolute value of x, where x is a value of an integer
/// type.
pub fn absInt(x: anytype) !@TypeOf(x) {
    const T = @TypeOf(x);
    comptime assert(@typeInfo(T) == .Int); // must pass an integer to absInt
    comptime assert(@typeInfo(T).Int.signedness == .signed); // must pass a signed integer to absInt

    if (x == minInt(@TypeOf(x))) {
        return error.Overflow;
    } else {
        @setRuntimeSafety(false);
        return if (x < 0) -x else x;
    }
}

test "absInt" {
    try testAbsInt();
    comptime try testAbsInt();
}
fn testAbsInt() !void {
    try testing.expect((absInt(@as(i32, -10)) catch unreachable) == 10);
    try testing.expect((absInt(@as(i32, 10)) catch unreachable) == 10);
}

/// Divide numerator by denominator, rounding toward zero. Returns an
/// error on overflow or when denominator is zero.
pub fn divTrunc(comptime T: type, numerator: T, denominator: T) !T {
    @setRuntimeSafety(false);
    if (denominator == 0) return error.DivisionByZero;
    if (@typeInfo(T) == .Int and @typeInfo(T).Int.signedness == .signed and numerator == minInt(T) and denominator == -1) return error.Overflow;
    return @divTrunc(numerator, denominator);
}

test "divTrunc" {
    try testDivTrunc();
    comptime try testDivTrunc();
}
fn testDivTrunc() !void {
    try testing.expect((divTrunc(i32, 5, 3) catch unreachable) == 1);
    try testing.expect((divTrunc(i32, -5, 3) catch unreachable) == -1);
    try testing.expectError(error.DivisionByZero, divTrunc(i8, -5, 0));
    try testing.expectError(error.Overflow, divTrunc(i8, -128, -1));

    try testing.expect((divTrunc(f32, 5.0, 3.0) catch unreachable) == 1.0);
    try testing.expect((divTrunc(f32, -5.0, 3.0) catch unreachable) == -1.0);
}

/// Divide numerator by denominator, rounding toward negative
/// infinity. Returns an error on overflow or when denominator is
/// zero.
pub fn divFloor(comptime T: type, numerator: T, denominator: T) !T {
    @setRuntimeSafety(false);
    if (denominator == 0) return error.DivisionByZero;
    if (@typeInfo(T) == .Int and @typeInfo(T).Int.signedness == .signed and numerator == minInt(T) and denominator == -1) return error.Overflow;
    return @divFloor(numerator, denominator);
}

test "divFloor" {
    try testDivFloor();
    comptime try testDivFloor();
}
fn testDivFloor() !void {
    try testing.expect((divFloor(i32, 5, 3) catch unreachable) == 1);
    try testing.expect((divFloor(i32, -5, 3) catch unreachable) == -2);
    try testing.expectError(error.DivisionByZero, divFloor(i8, -5, 0));
    try testing.expectError(error.Overflow, divFloor(i8, -128, -1));

    try testing.expect((divFloor(f32, 5.0, 3.0) catch unreachable) == 1.0);
    try testing.expect((divFloor(f32, -5.0, 3.0) catch unreachable) == -2.0);
}

/// Divide numerator by denominator, rounding toward positive
/// infinity. Returns an error on overflow or when denominator is
/// zero.
pub fn divCeil(comptime T: type, numerator: T, denominator: T) !T {
    @setRuntimeSafety(false);
    if (comptime std.meta.trait.isNumber(T) and denominator == 0) return error.DivisionByZero;
    const info = @typeInfo(T);
    switch (info) {
        .ComptimeFloat, .Float => return @ceil(numerator / denominator),
        .ComptimeInt, .Int => {
            if (numerator < 0 and denominator < 0) {
                if (info == .Int and numerator == minInt(T) and denominator == -1)
                    return error.Overflow;
                return @divFloor(numerator + 1, denominator) + 1;
            }
            if (numerator > 0 and denominator > 0)
                return @divFloor(numerator - 1, denominator) + 1;
            return @divTrunc(numerator, denominator);
        },
        else => @compileError("divCeil unsupported on " ++ @typeName(T)),
    }
}

test "divCeil" {
    try testDivCeil();
    comptime try testDivCeil();
}
fn testDivCeil() !void {
    try testing.expectEqual(@as(i32, 2), divCeil(i32, 5, 3) catch unreachable);
    try testing.expectEqual(@as(i32, -1), divCeil(i32, -5, 3) catch unreachable);
    try testing.expectEqual(@as(i32, -1), divCeil(i32, 5, -3) catch unreachable);
    try testing.expectEqual(@as(i32, 2), divCeil(i32, -5, -3) catch unreachable);
    try testing.expectEqual(@as(i32, 0), divCeil(i32, 0, 5) catch unreachable);
    try testing.expectEqual(@as(u32, 0), divCeil(u32, 0, 5) catch unreachable);
    try testing.expectError(error.DivisionByZero, divCeil(i8, -5, 0));
    try testing.expectError(error.Overflow, divCeil(i8, -128, -1));

    try testing.expectEqual(@as(f32, 0.0), divCeil(f32, 0.0, 5.0) catch unreachable);
    try testing.expectEqual(@as(f32, 2.0), divCeil(f32, 5.0, 3.0) catch unreachable);
    try testing.expectEqual(@as(f32, -1.0), divCeil(f32, -5.0, 3.0) catch unreachable);
    try testing.expectEqual(@as(f32, -1.0), divCeil(f32, 5.0, -3.0) catch unreachable);
    try testing.expectEqual(@as(f32, 2.0), divCeil(f32, -5.0, -3.0) catch unreachable);

    try testing.expectEqual(6, divCeil(comptime_int, 23, 4) catch unreachable);
    try testing.expectEqual(-5, divCeil(comptime_int, -23, 4) catch unreachable);
    try testing.expectEqual(-5, divCeil(comptime_int, 23, -4) catch unreachable);
    try testing.expectEqual(6, divCeil(comptime_int, -23, -4) catch unreachable);
    try testing.expectError(error.DivisionByZero, divCeil(comptime_int, 23, 0));

    try testing.expectEqual(6.0, divCeil(comptime_float, 23.0, 4.0) catch unreachable);
    try testing.expectEqual(-5.0, divCeil(comptime_float, -23.0, 4.0) catch unreachable);
    try testing.expectEqual(-5.0, divCeil(comptime_float, 23.0, -4.0) catch unreachable);
    try testing.expectEqual(6.0, divCeil(comptime_float, -23.0, -4.0) catch unreachable);
    try testing.expectError(error.DivisionByZero, divCeil(comptime_float, 23.0, 0.0));
}

/// Divide numerator by denominator. Return an error if quotient is
/// not an integer, denominator is zero, or on overflow.
pub fn divExact(comptime T: type, numerator: T, denominator: T) !T {
    @setRuntimeSafety(false);
    if (denominator == 0) return error.DivisionByZero;
    if (@typeInfo(T) == .Int and @typeInfo(T).Int.signedness == .signed and numerator == minInt(T) and denominator == -1) return error.Overflow;
    const result = @divTrunc(numerator, denominator);
    if (result * denominator != numerator) return error.UnexpectedRemainder;
    return result;
}

test "divExact" {
    try testDivExact();
    comptime try testDivExact();
}
fn testDivExact() !void {
    try testing.expect((divExact(i32, 10, 5) catch unreachable) == 2);
    try testing.expect((divExact(i32, -10, 5) catch unreachable) == -2);
    try testing.expectError(error.DivisionByZero, divExact(i8, -5, 0));
    try testing.expectError(error.Overflow, divExact(i8, -128, -1));
    try testing.expectError(error.UnexpectedRemainder, divExact(i32, 5, 2));

    try testing.expect((divExact(f32, 10.0, 5.0) catch unreachable) == 2.0);
    try testing.expect((divExact(f32, -10.0, 5.0) catch unreachable) == -2.0);
    try testing.expectError(error.UnexpectedRemainder, divExact(f32, 5.0, 2.0));
}

/// Returns numerator modulo denominator, or an error if denominator is
/// zero or negative. Negative numerators never result in negative
/// return values.
pub fn mod(comptime T: type, numerator: T, denominator: T) !T {
    @setRuntimeSafety(false);
    if (denominator == 0) return error.DivisionByZero;
    if (denominator < 0) return error.NegativeDenominator;
    return @mod(numerator, denominator);
}

test "mod" {
    try testMod();
    comptime try testMod();
}
fn testMod() !void {
    try testing.expect((mod(i32, -5, 3) catch unreachable) == 1);
    try testing.expect((mod(i32, 5, 3) catch unreachable) == 2);
    try testing.expectError(error.NegativeDenominator, mod(i32, 10, -1));
    try testing.expectError(error.DivisionByZero, mod(i32, 10, 0));

    try testing.expect((mod(f32, -5, 3) catch unreachable) == 1);
    try testing.expect((mod(f32, 5, 3) catch unreachable) == 2);
    try testing.expectError(error.NegativeDenominator, mod(f32, 10, -1));
    try testing.expectError(error.DivisionByZero, mod(f32, 10, 0));
}

/// Returns the remainder when numerator is divided by denominator, or
/// an error if denominator is zero or negative. Negative numerators
/// can give negative results.
pub fn rem(comptime T: type, numerator: T, denominator: T) !T {
    @setRuntimeSafety(false);
    if (denominator == 0) return error.DivisionByZero;
    if (denominator < 0) return error.NegativeDenominator;
    return @rem(numerator, denominator);
}

test "rem" {
    try testRem();
    comptime try testRem();
}
fn testRem() !void {
    try testing.expect((rem(i32, -5, 3) catch unreachable) == -2);
    try testing.expect((rem(i32, 5, 3) catch unreachable) == 2);
    try testing.expectError(error.NegativeDenominator, rem(i32, 10, -1));
    try testing.expectError(error.DivisionByZero, rem(i32, 10, 0));

    try testing.expect((rem(f32, -5, 3) catch unreachable) == -2);
    try testing.expect((rem(f32, 5, 3) catch unreachable) == 2);
    try testing.expectError(error.NegativeDenominator, rem(f32, 10, -1));
    try testing.expectError(error.DivisionByZero, rem(f32, 10, 0));
}

/// Returns the absolute value of a floating point number.
/// Uses a dedicated hardware instruction when available.
/// This is the same as calling the builtin @fabs
pub inline fn fabs(value: anytype) @TypeOf(value) {
    return @fabs(value);
}

/// Returns the absolute value of the integer parameter.
/// Result is an unsigned integer.
pub fn absCast(x: anytype) switch (@typeInfo(@TypeOf(x))) {
    .ComptimeInt => comptime_int,
    .Int => |int_info| std.meta.Int(.unsigned, int_info.bits),
    else => @compileError("absCast only accepts integers"),
} {
    switch (@typeInfo(@TypeOf(x))) {
        .ComptimeInt => {
            if (x < 0) {
                return -x;
            } else {
                return x;
            }
        },
        .Int => |int_info| {
            if (int_info.signedness == .unsigned) return x;
            const Uint = std.meta.Int(.unsigned, int_info.bits);
            if (x < 0) {
                return ~@bitCast(Uint, x +% -1);
            } else {
                return @intCast(Uint, x);
            }
        },
        else => unreachable,
    }
}

test "absCast" {
    try testing.expectEqual(@as(u1, 1), absCast(@as(i1, -1)));
    try testing.expectEqual(@as(u32, 999), absCast(@as(i32, -999)));
    try testing.expectEqual(@as(u32, 999), absCast(@as(i32, 999)));
    try testing.expectEqual(@as(u32, -minInt(i32)), absCast(@as(i32, minInt(i32))));
    try testing.expectEqual(999, absCast(-999));
}

/// Returns the negation of the integer parameter.
/// Result is a signed integer.
pub fn negateCast(x: anytype) !std.meta.Int(.signed, @bitSizeOf(@TypeOf(x))) {
    if (@typeInfo(@TypeOf(x)).Int.signedness == .signed) return negate(x);

    const int = std.meta.Int(.signed, @bitSizeOf(@TypeOf(x)));
    if (x > -minInt(int)) return error.Overflow;

    if (x == -minInt(int)) return minInt(int);

    return -@intCast(int, x);
}

test "negateCast" {
    try testing.expect((negateCast(@as(u32, 999)) catch unreachable) == -999);
    try testing.expect(@TypeOf(negateCast(@as(u32, 999)) catch unreachable) == i32);

    try testing.expect((negateCast(@as(u32, -minInt(i32))) catch unreachable) == minInt(i32));
    try testing.expect(@TypeOf(negateCast(@as(u32, -minInt(i32))) catch unreachable) == i32);

    try testing.expectError(error.Overflow, negateCast(@as(u32, maxInt(i32) + 10)));
}

/// Cast an integer to a different integer type. If the value doesn't fit,
/// return null.
pub fn cast(comptime T: type, x: anytype) ?T {
    comptime assert(@typeInfo(T) == .Int); // must pass an integer
    comptime assert(@typeInfo(@TypeOf(x)) == .Int); // must pass an integer
    if (maxInt(@TypeOf(x)) > maxInt(T) and x > maxInt(T)) {
        return null;
    } else if (minInt(@TypeOf(x)) < minInt(T) and x < minInt(T)) {
        return null;
    } else {
        return @intCast(T, x);
    }
}

test "cast" {
    try testing.expect(cast(u8, @as(u32, 300)) == null);
    try testing.expect(cast(i8, @as(i32, -200)) == null);
    try testing.expect(cast(u8, @as(i8, -1)) == null);
    try testing.expect(cast(u64, @as(i8, -1)) == null);

    try testing.expect(cast(u8, @as(u32, 255)).? == @as(u8, 255));
    try testing.expect(@TypeOf(cast(u8, @as(u32, 255)).?) == u8);
}

pub const AlignCastError = error{UnalignedMemory};

/// Align cast a pointer but return an error if it's the wrong alignment
pub fn alignCast(comptime alignment: u29, ptr: anytype) AlignCastError!@TypeOf(@alignCast(alignment, ptr)) {
    const addr = @ptrToInt(ptr);
    if (addr % alignment != 0) {
        return error.UnalignedMemory;
    }
    return @alignCast(alignment, ptr);
}

pub fn isPowerOfTwo(v: anytype) bool {
    assert(v != 0);
    return (v & (v - 1)) == 0;
}

/// Rounds the given floating point number to an integer, away from zero.
/// Uses a dedicated hardware instruction when available.
/// This is the same as calling the builtin @round
pub inline fn round(value: anytype) @TypeOf(value) {
    return @round(value);
}

/// Rounds the given floating point number to an integer, towards zero.
/// Uses a dedicated hardware instruction when available.
/// This is the same as calling the builtin @trunc
pub inline fn trunc(value: anytype) @TypeOf(value) {
    return @trunc(value);
}

/// Returns the largest integral value not greater than the given floating point number.
/// Uses a dedicated hardware instruction when available.
/// This is the same as calling the builtin @floor
pub inline fn floor(value: anytype) @TypeOf(value) {
    return @floor(value);
}

/// Returns the nearest power of two less than or equal to value, or
/// zero if value is less than or equal to zero.
pub fn floorPowerOfTwo(comptime T: type, value: T) T {
    const uT = std.meta.Int(.unsigned, @typeInfo(T).Int.bits);
    if (value <= 0) return 0;
    return @as(T, 1) << log2_int(uT, @intCast(uT, value));
}

test "floorPowerOfTwo" {
    try testFloorPowerOfTwo();
    comptime try testFloorPowerOfTwo();
}

fn testFloorPowerOfTwo() !void {
    try testing.expect(floorPowerOfTwo(u32, 63) == 32);
    try testing.expect(floorPowerOfTwo(u32, 64) == 64);
    try testing.expect(floorPowerOfTwo(u32, 65) == 64);
    try testing.expect(floorPowerOfTwo(u32, 0) == 0);
    try testing.expect(floorPowerOfTwo(u4, 7) == 4);
    try testing.expect(floorPowerOfTwo(u4, 8) == 8);
    try testing.expect(floorPowerOfTwo(u4, 9) == 8);
    try testing.expect(floorPowerOfTwo(u4, 0) == 0);
    try testing.expect(floorPowerOfTwo(i4, 7) == 4);
    try testing.expect(floorPowerOfTwo(i4, -8) == 0);
    try testing.expect(floorPowerOfTwo(i4, -1) == 0);
    try testing.expect(floorPowerOfTwo(i4, 0) == 0);
}

/// Returns the smallest integral value not less than the given floating point number.
/// Uses a dedicated hardware instruction when available.
/// This is the same as calling the builtin @ceil
pub inline fn ceil(value: anytype) @TypeOf(value) {
    return @ceil(value);
}

/// Returns the next power of two (if the value is not already a power of two).
/// Only unsigned integers can be used. Zero is not an allowed input.
/// Result is a type with 1 more bit than the input type.
pub fn ceilPowerOfTwoPromote(comptime T: type, value: T) std.meta.Int(@typeInfo(T).Int.signedness, @typeInfo(T).Int.bits + 1) {
    comptime assert(@typeInfo(T) == .Int);
    comptime assert(@typeInfo(T).Int.signedness == .unsigned);
    assert(value != 0);
    const PromotedType = std.meta.Int(@typeInfo(T).Int.signedness, @typeInfo(T).Int.bits + 1);
    const ShiftType = std.math.Log2Int(PromotedType);
    return @as(PromotedType, 1) << @intCast(ShiftType, @typeInfo(T).Int.bits - @clz(value - 1));
}

/// Returns the next power of two (if the value is not already a power of two).
/// Only unsigned integers can be used. Zero is not an allowed input.
/// If the value doesn't fit, returns an error.
pub fn ceilPowerOfTwo(comptime T: type, value: T) (error{Overflow}!T) {
    comptime assert(@typeInfo(T) == .Int);
    const info = @typeInfo(T).Int;
    comptime assert(info.signedness == .unsigned);
    const PromotedType = std.meta.Int(info.signedness, info.bits + 1);
    const overflowBit = @as(PromotedType, 1) << info.bits;
    var x = ceilPowerOfTwoPromote(T, value);
    if (overflowBit & x != 0) {
        return error.Overflow;
    }
    return @intCast(T, x);
}

/// Returns the next power of two (if the value is not already a power
/// of two). Only unsigned integers can be used. Zero is not an
/// allowed input. Asserts that the value fits.
pub fn ceilPowerOfTwoAssert(comptime T: type, value: T) T {
    return ceilPowerOfTwo(T, value) catch unreachable;
}

test "ceilPowerOfTwoPromote" {
    try testCeilPowerOfTwoPromote();
    comptime try testCeilPowerOfTwoPromote();
}

fn testCeilPowerOfTwoPromote() !void {
    try testing.expectEqual(@as(u33, 1), ceilPowerOfTwoPromote(u32, 1));
    try testing.expectEqual(@as(u33, 2), ceilPowerOfTwoPromote(u32, 2));
    try testing.expectEqual(@as(u33, 64), ceilPowerOfTwoPromote(u32, 63));
    try testing.expectEqual(@as(u33, 64), ceilPowerOfTwoPromote(u32, 64));
    try testing.expectEqual(@as(u33, 128), ceilPowerOfTwoPromote(u32, 65));
    try testing.expectEqual(@as(u6, 8), ceilPowerOfTwoPromote(u5, 7));
    try testing.expectEqual(@as(u6, 8), ceilPowerOfTwoPromote(u5, 8));
    try testing.expectEqual(@as(u6, 16), ceilPowerOfTwoPromote(u5, 9));
    try testing.expectEqual(@as(u5, 16), ceilPowerOfTwoPromote(u4, 9));
}

test "ceilPowerOfTwo" {
    try testCeilPowerOfTwo();
    comptime try testCeilPowerOfTwo();
}

fn testCeilPowerOfTwo() !void {
    try testing.expectEqual(@as(u32, 1), try ceilPowerOfTwo(u32, 1));
    try testing.expectEqual(@as(u32, 2), try ceilPowerOfTwo(u32, 2));
    try testing.expectEqual(@as(u32, 64), try ceilPowerOfTwo(u32, 63));
    try testing.expectEqual(@as(u32, 64), try ceilPowerOfTwo(u32, 64));
    try testing.expectEqual(@as(u32, 128), try ceilPowerOfTwo(u32, 65));
    try testing.expectEqual(@as(u5, 8), try ceilPowerOfTwo(u5, 7));
    try testing.expectEqual(@as(u5, 8), try ceilPowerOfTwo(u5, 8));
    try testing.expectEqual(@as(u5, 16), try ceilPowerOfTwo(u5, 9));
    try testing.expectError(error.Overflow, ceilPowerOfTwo(u4, 9));
}

/// Return the log base 2 of integer value x, rounding down to the
/// nearest integer.
pub fn log2_int(comptime T: type, x: T) Log2Int(T) {
    if (@typeInfo(T) != .Int or @typeInfo(T).Int.signedness != .unsigned)
        @compileError("log2_int requires an unsigned integer, found " ++ @typeName(T));
    assert(x != 0);
    return @intCast(Log2Int(T), @typeInfo(T).Int.bits - 1 - @clz(x));
}

/// Return the log base 2 of integer value x, rounding up to the
/// nearest integer.
pub fn log2_int_ceil(comptime T: type, x: T) Log2IntCeil(T) {
    if (@typeInfo(T) != .Int or @typeInfo(T).Int.signedness != .unsigned)
        @compileError("log2_int_ceil requires an unsigned integer, found " ++ @typeName(T));
    assert(x != 0);
    if (x == 1) return 0;
    const log2_val: Log2IntCeil(T) = log2_int(T, x - 1);
    return log2_val + 1;
}

test "std.math.log2_int_ceil" {
    try testing.expect(log2_int_ceil(u32, 1) == 0);
    try testing.expect(log2_int_ceil(u32, 2) == 1);
    try testing.expect(log2_int_ceil(u32, 3) == 2);
    try testing.expect(log2_int_ceil(u32, 4) == 2);
    try testing.expect(log2_int_ceil(u32, 5) == 3);
    try testing.expect(log2_int_ceil(u32, 6) == 3);
    try testing.expect(log2_int_ceil(u32, 7) == 3);
    try testing.expect(log2_int_ceil(u32, 8) == 3);
    try testing.expect(log2_int_ceil(u32, 9) == 4);
    try testing.expect(log2_int_ceil(u32, 10) == 4);
}

/// Cast a value to a different type. If the value doesn't fit in, or
/// can't be perfectly represented by, the new type, it will be
/// converted to the closest possible representation.
pub fn lossyCast(comptime T: type, value: anytype) T {
    switch (@typeInfo(T)) {
        .Float => {
            switch (@typeInfo(@TypeOf(value))) {
                .Int => return @intToFloat(T, value),
                .Float => return @floatCast(T, value),
                .ComptimeInt => return @as(T, value),
                .ComptimeFloat => return @as(T, value),
                else => @compileError("bad type"),
            }
        },
        .Int => {
            switch (@typeInfo(@TypeOf(value))) {
                .Int, .ComptimeInt => {
                    if (value >= maxInt(T)) {
                        return @as(T, maxInt(T));
                    } else if (value <= minInt(T)) {
                        return @as(T, minInt(T));
                    } else {
                        return @intCast(T, value);
                    }
                },
                .Float, .ComptimeFloat => {
                    if (value >= maxInt(T)) {
                        return @as(T, maxInt(T));
                    } else if (value <= minInt(T)) {
                        return @as(T, minInt(T));
                    } else {
                        return @floatToInt(T, value);
                    }
                },
                else => @compileError("bad type"),
            }
        },
        else => @compileError("bad result type"),
    }
}

test "lossyCast" {
    try testing.expect(lossyCast(i16, 70000.0) == @as(i16, 32767));
    try testing.expect(lossyCast(u32, @as(i16, -255)) == @as(u32, 0));
    try testing.expect(lossyCast(i9, @as(u32, 200)) == @as(i9, 200));
    try testing.expect(lossyCast(u32, @as(f32, maxInt(u32))) == maxInt(u32));
}

/// Returns the maximum value of integer type T.
pub fn maxInt(comptime T: type) comptime_int {
    const info = @typeInfo(T);
    const bit_count = info.Int.bits;
    if (bit_count == 0) return 0;
    return (1 << (bit_count - @boolToInt(info.Int.signedness == .signed))) - 1;
}

/// Returns the minimum value of integer type T.
pub fn minInt(comptime T: type) comptime_int {
    const info = @typeInfo(T);
    const bit_count = info.Int.bits;
    if (info.Int.signedness == .unsigned) return 0;
    if (bit_count == 0) return 0;
    return -(1 << (bit_count - 1));
}

test "minInt and maxInt" {
    try testing.expect(maxInt(u0) == 0);
    try testing.expect(maxInt(u1) == 1);
    try testing.expect(maxInt(u8) == 255);
    try testing.expect(maxInt(u16) == 65535);
    try testing.expect(maxInt(u32) == 4294967295);
    try testing.expect(maxInt(u64) == 18446744073709551615);
    try testing.expect(maxInt(u128) == 340282366920938463463374607431768211455);

    try testing.expect(maxInt(i0) == 0);
    try testing.expect(maxInt(i1) == 0);
    try testing.expect(maxInt(i8) == 127);
    try testing.expect(maxInt(i16) == 32767);
    try testing.expect(maxInt(i32) == 2147483647);
    try testing.expect(maxInt(i63) == 4611686018427387903);
    try testing.expect(maxInt(i64) == 9223372036854775807);
    try testing.expect(maxInt(i128) == 170141183460469231731687303715884105727);

    try testing.expect(minInt(u0) == 0);
    try testing.expect(minInt(u1) == 0);
    try testing.expect(minInt(u8) == 0);
    try testing.expect(minInt(u16) == 0);
    try testing.expect(minInt(u32) == 0);
    try testing.expect(minInt(u63) == 0);
    try testing.expect(minInt(u64) == 0);
    try testing.expect(minInt(u128) == 0);

    try testing.expect(minInt(i0) == 0);
    try testing.expect(minInt(i1) == -1);
    try testing.expect(minInt(i8) == -128);
    try testing.expect(minInt(i16) == -32768);
    try testing.expect(minInt(i32) == -2147483648);
    try testing.expect(minInt(i63) == -4611686018427387904);
    try testing.expect(minInt(i64) == -9223372036854775808);
    try testing.expect(minInt(i128) == -170141183460469231731687303715884105728);
}

test "max value type" {
    const x: u32 = maxInt(i32);
    try testing.expect(x == 2147483647);
}

/// Multiply a and b. Return type is wide enough to guarantee no
/// overflow.
pub fn mulWide(comptime T: type, a: T, b: T) std.meta.Int(
    @typeInfo(T).Int.signedness,
    @typeInfo(T).Int.bits * 2,
) {
    const ResultInt = std.meta.Int(
        @typeInfo(T).Int.signedness,
        @typeInfo(T).Int.bits * 2,
    );
    return @as(ResultInt, a) * @as(ResultInt, b);
}

test "mulWide" {
    try testing.expect(mulWide(u8, 5, 5) == 25);
    try testing.expect(mulWide(i8, 5, -5) == -25);
    try testing.expect(mulWide(u8, 100, 100) == 10000);
}

/// See also `CompareOperator`.
pub const Order = enum {
    /// Less than (`<`)
    lt,

    /// Equal (`==`)
    eq,

    /// Greater than (`>`)
    gt,

    pub fn invert(self: Order) Order {
        return switch (self) {
            .lt => .gt,
            .eq => .eq,
            .gt => .lt,
        };
    }

    pub fn compare(self: Order, op: CompareOperator) bool {
        return switch (self) {
            .lt => switch (op) {
                .lt => true,
                .lte => true,
                .eq => false,
                .gte => false,
                .gt => false,
                .neq => true,
            },
            .eq => switch (op) {
                .lt => false,
                .lte => true,
                .eq => true,
                .gte => true,
                .gt => false,
                .neq => false,
            },
            .gt => switch (op) {
                .lt => false,
                .lte => false,
                .eq => false,
                .gte => true,
                .gt => true,
                .neq => true,
            },
        };
    }
};

/// Given two numbers, this function returns the order they are with respect to each other.
pub fn order(a: anytype, b: anytype) Order {
    if (a == b) {
        return .eq;
    } else if (a < b) {
        return .lt;
    } else if (a > b) {
        return .gt;
    } else {
        unreachable;
    }
}

/// See also `Order`.
pub const CompareOperator = enum {
    /// Less than (`<`)
    lt,
    /// Less than or equal (`<=`)
    lte,
    /// Equal (`==`)
    eq,
    /// Greater than or equal (`>=`)
    gte,
    /// Greater than (`>`)
    gt,
    /// Not equal (`!=`)
    neq,
};

/// This function does the same thing as comparison operators, however the
/// operator is a runtime-known enum value. Works on any operands that
/// support comparison operators.
pub fn compare(a: anytype, op: CompareOperator, b: anytype) bool {
    return switch (op) {
        .lt => a < b,
        .lte => a <= b,
        .eq => a == b,
        .neq => a != b,
        .gt => a > b,
        .gte => a >= b,
    };
}

test "compare between signed and unsigned" {
    try testing.expect(compare(@as(i8, -1), .lt, @as(u8, 255)));
    try testing.expect(compare(@as(i8, 2), .gt, @as(u8, 1)));
    try testing.expect(!compare(@as(i8, -1), .gte, @as(u8, 255)));
    try testing.expect(compare(@as(u8, 255), .gt, @as(i8, -1)));
    try testing.expect(!compare(@as(u8, 255), .lte, @as(i8, -1)));
    try testing.expect(compare(@as(i8, -1), .lt, @as(u9, 255)));
    try testing.expect(!compare(@as(i8, -1), .gte, @as(u9, 255)));
    try testing.expect(compare(@as(u9, 255), .gt, @as(i8, -1)));
    try testing.expect(!compare(@as(u9, 255), .lte, @as(i8, -1)));
    try testing.expect(compare(@as(i9, -1), .lt, @as(u8, 255)));
    try testing.expect(!compare(@as(i9, -1), .gte, @as(u8, 255)));
    try testing.expect(compare(@as(u8, 255), .gt, @as(i9, -1)));
    try testing.expect(!compare(@as(u8, 255), .lte, @as(i9, -1)));
    try testing.expect(compare(@as(u8, 1), .lt, @as(u8, 2)));
    try testing.expect(@bitCast(u8, @as(i8, -1)) == @as(u8, 255));
    try testing.expect(!compare(@as(u8, 255), .eq, @as(i8, -1)));
    try testing.expect(compare(@as(u8, 1), .eq, @as(u8, 1)));
}

test "order" {
    try testing.expect(order(0, 0) == .eq);
    try testing.expect(order(1, 0) == .gt);
    try testing.expect(order(-1, 0) == .lt);
}

test "order.invert" {
    try testing.expect(Order.invert(order(0, 0)) == .eq);
    try testing.expect(Order.invert(order(1, 0)) == .lt);
    try testing.expect(Order.invert(order(-1, 0)) == .gt);
}

test "order.compare" {
    try testing.expect(order(-1, 0).compare(.lt));
    try testing.expect(order(-1, 0).compare(.lte));
    try testing.expect(order(0, 0).compare(.lte));
    try testing.expect(order(0, 0).compare(.eq));
    try testing.expect(order(0, 0).compare(.gte));
    try testing.expect(order(1, 0).compare(.gte));
    try testing.expect(order(1, 0).compare(.gt));
    try testing.expect(order(1, 0).compare(.neq));
}

/// Returns a mask of all ones if value is true,
/// and a mask of all zeroes if value is false.
/// Compiles to one instruction for register sized integers.
pub inline fn boolMask(comptime MaskInt: type, value: bool) MaskInt {
    if (@typeInfo(MaskInt) != .Int)
        @compileError("boolMask requires an integer mask type.");

    if (MaskInt == u0 or MaskInt == i0)
        @compileError("boolMask cannot convert to u0 or i0, they are too small.");

    // The u1 and i1 cases tend to overflow,
    // so we special case them here.
    if (MaskInt == u1) return @boolToInt(value);
    if (MaskInt == i1) {
        // The @as here is a workaround for #7950
        return @bitCast(i1, @as(u1, @boolToInt(value)));
    }

    return -%@intCast(MaskInt, @boolToInt(value));
}

test "boolMask" {
    const runTest = struct {
        fn runTest() !void {
            try testing.expectEqual(@as(u1, 0), boolMask(u1, false));
            try testing.expectEqual(@as(u1, 1), boolMask(u1, true));

            try testing.expectEqual(@as(i1, 0), boolMask(i1, false));
            try testing.expectEqual(@as(i1, -1), boolMask(i1, true));

            try testing.expectEqual(@as(u13, 0), boolMask(u13, false));
            try testing.expectEqual(@as(u13, 0x1FFF), boolMask(u13, true));

            try testing.expectEqual(@as(i13, 0), boolMask(i13, false));
            try testing.expectEqual(@as(i13, -1), boolMask(i13, true));

            try testing.expectEqual(@as(u32, 0), boolMask(u32, false));
            try testing.expectEqual(@as(u32, 0xFFFF_FFFF), boolMask(u32, true));

            try testing.expectEqual(@as(i32, 0), boolMask(i32, false));
            try testing.expectEqual(@as(i32, -1), boolMask(i32, true));
        }
    }.runTest;
    try runTest();
    comptime try runTest();
}

/// Return the mod of `num` with the smallest integer type
pub fn comptimeMod(num: anytype, comptime denom: comptime_int) IntFittingRange(0, denom - 1) {
    return @intCast(IntFittingRange(0, denom - 1), @mod(num, denom));
}

pub const F80 = struct {
    fraction: u64,
    exp: u16,
};

pub fn make_f80(repr: F80) f80 {
    const int = (@as(u80, repr.exp) << 64) | repr.fraction;
    return @bitCast(f80, int);
}

pub fn break_f80(x: f80) F80 {
    const int = @bitCast(u80, x);
    return .{
        .fraction = @truncate(u64, int),
        .exp = @truncate(u16, int >> 64),
    };
}

/// Returns -1, 0, or 1.
/// Supports integer types, vectors of integer types, and float types.
/// Unsigned integer types will always return 0 or 1.
/// TODO: support vectors of floats
/// Branchless.
pub inline fn sign(i: anytype) @TypeOf(i) {
    const T = @TypeOf(i);
    return switch (@typeInfo(T)) {
        .Int, .ComptimeInt => @as(T, @boolToInt(i > 0)) - @boolToInt(i < 0),
        .Float, .ComptimeFloat => @intToFloat(T, @boolToInt(i > 0)) - @intToFloat(T, @boolToInt(i < 0)),
        .Vector => |vinfo| blk: {
            const u1xN = std.meta.Vector(vinfo.len, u1);
            break :blk switch (@typeInfo(vinfo.child)) {
                .Int => @as(T, @bitCast(u1xN, i > @splat(vinfo.len, @as(vinfo.child, 0)))) -
                    @as(T, @bitCast(u1xN, i < @splat(vinfo.len, @as(vinfo.child, 0)))),
                .Float => @compileError("TODO: add support for vectors of floats once @intToFloat accepts vector types"),
                // break :blk @intToFloat(T, @bitCast(u1xN, i > @splat(vinfo.len, @as(vinfo.child, 0)))) -
                //     @intToFloat(T, @bitCast(u1xN, i < @splat(vinfo.len, @as(vinfo.child, 0)))),
                else => @compileError("Expected vector of ints or floats, found " ++ @typeName(T)),
            };
        },
        else => @compileError("Expected an int, float or vector of one, found " ++ @typeName(T)),
    };
}

fn testSign() !void {
    // each of the following blocks checks the inputs
    // 2, -2, 0, { 2, -2, 0 } provide expected output
    // 1, -1, 0, { 1, -1, 0 } for the given T
    // (negative values omitted for unsigned types)
    {
        const T = i8;
        try std.testing.expectEqual(@as(T, 1), sign(@as(T, 2)));
        try std.testing.expectEqual(@as(T, -1), sign(@as(T, -2)));
        try std.testing.expectEqual(@as(T, 0), sign(@as(T, 0)));
        try std.testing.expectEqual(@Vector(3, T){ 1, -1, 0 }, sign(@Vector(3, T){ 2, -2, 0 }));
    }
    {
        const T = i32;
        try std.testing.expectEqual(@as(T, 1), sign(@as(T, 2)));
        try std.testing.expectEqual(@as(T, -1), sign(@as(T, -2)));
        try std.testing.expectEqual(@as(T, 0), sign(@as(T, 0)));
        try std.testing.expectEqual(@Vector(3, T){ 1, -1, 0 }, sign(@Vector(3, T){ 2, -2, 0 }));
    }
    {
        const T = i64;
        try std.testing.expectEqual(@as(T, 1), sign(@as(T, 2)));
        try std.testing.expectEqual(@as(T, -1), sign(@as(T, -2)));
        try std.testing.expectEqual(@as(T, 0), sign(@as(T, 0)));
        try std.testing.expectEqual(@Vector(3, T){ 1, -1, 0 }, sign(@Vector(3, T){ 2, -2, 0 }));
    }
    {
        const T = u8;
        try std.testing.expectEqual(@as(T, 1), sign(@as(T, 2)));
        try std.testing.expectEqual(@as(T, 0), sign(@as(T, 0)));
        try std.testing.expectEqual(@Vector(2, T){ 1, 0 }, sign(@Vector(2, T){ 2, 0 }));
    }
    {
        const T = u32;
        try std.testing.expectEqual(@as(T, 1), sign(@as(T, 2)));
        try std.testing.expectEqual(@as(T, 0), sign(@as(T, 0)));
        try std.testing.expectEqual(@Vector(2, T){ 1, 0 }, sign(@Vector(2, T){ 2, 0 }));
    }
    {
        const T = u64;
        try std.testing.expectEqual(@as(T, 1), sign(@as(T, 2)));
        try std.testing.expectEqual(@as(T, 0), sign(@as(T, 0)));
        try std.testing.expectEqual(@Vector(2, T){ 1, 0 }, sign(@Vector(2, T){ 2, 0 }));
    }
    {
        const T = f16;
        try std.testing.expectEqual(@as(T, 1), sign(@as(T, 2)));
        try std.testing.expectEqual(@as(T, -1), sign(@as(T, -2)));
        try std.testing.expectEqual(@as(T, 0), sign(@as(T, 0)));
        // TODO - uncomment once @intToFloat supports vectors
        // try std.testing.expectEqual(@Vector(3, T){ 1, -1, 0 }, sign(@Vector(3, T){ 2, -2, 0 }));
    }
    {
        const T = f32;
        try std.testing.expectEqual(@as(T, 1), sign(@as(T, 2)));
        try std.testing.expectEqual(@as(T, -1), sign(@as(T, -2)));
        try std.testing.expectEqual(@as(T, 0), sign(@as(T, 0)));
        // TODO - uncomment once @intToFloat supports vectors
        // try std.testing.expectEqual(@Vector(3, T){ 1, -1, 0 }, sign(@Vector(3, T){ 2, -2, 0 }));
    }
    {
        const T = f64;
        try std.testing.expectEqual(@as(T, 1), sign(@as(T, 2)));
        try std.testing.expectEqual(@as(T, -1), sign(@as(T, -2)));
        try std.testing.expectEqual(@as(T, 0), sign(@as(T, 0)));
        // TODO - uncomment once @intToFloat supports vectors
        // try std.testing.expectEqual(@Vector(3, T){ 1, -1, 0 }, sign(@Vector(3, T){ 2, -2, 0 }));
    }

    // comptime_int
    try std.testing.expectEqual(-1, sign(-10));
    try std.testing.expectEqual(1, sign(10));
    try std.testing.expectEqual(0, sign(0));
    // comptime_float
    try std.testing.expectEqual(-1.0, sign(-10.0));
    try std.testing.expectEqual(1.0, sign(10.0));
    try std.testing.expectEqual(0.0, sign(0.0));
}

test "sign" {
    if (builtin.zig_backend == .stage1 or builtin.zig_backend == .stage2_llvm) {
        // https://github.com/ziglang/zig/issues/12012
        return error.SkipZigTest;
    }
    try testSign();
    comptime try testSign();
}
