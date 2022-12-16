export function solution(num1, num2) {
    let sum = num1 + num2;
    let sub = num1 - num2;
  
    for (let i = sum; i >= 1; i /= 10) {
      sub *= 10;
    }
  
    return sum + sub;
}