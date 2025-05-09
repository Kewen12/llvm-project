; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --no_x86_scrub_sp
; RUN: llc -mtriple=i386-linux-gnu                       -global-isel -verify-machineinstrs < %s | FileCheck %s
; RUN: llc -mtriple=i386-linux-gnu -regbankselect-greedy -global-isel -verify-machineinstrs < %s | FileCheck %s

;TODO merge with x86-64 tests (many operations not suppored yet)

define i1 @test_load_i1(ptr %p1) {
; CHECK-LABEL: test_load_i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl 4(%esp), %eax
; CHECK-NEXT:    movzbl (%eax), %eax
; CHECK-NEXT:    retl
  %r = load i1, ptr %p1
  ret i1 %r
}

define i8 @test_load_i8(ptr %p1) {
; CHECK-LABEL: test_load_i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl 4(%esp), %eax
; CHECK-NEXT:    movzbl (%eax), %eax
; CHECK-NEXT:    retl
  %r = load i8, ptr %p1
  ret i8 %r
}

define i16 @test_load_i16(ptr %p1) {
; CHECK-LABEL: test_load_i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl 4(%esp), %eax
; CHECK-NEXT:    movzwl (%eax), %eax
; CHECK-NEXT:    retl
  %r = load i16, ptr %p1
  ret i16 %r
}

define i32 @test_load_i32(ptr %p1) {
; CHECK-LABEL: test_load_i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl 4(%esp), %eax
; CHECK-NEXT:    movl (%eax), %eax
; CHECK-NEXT:    retl
  %r = load i32, ptr %p1
  ret i32 %r
}

define ptr @test_store_i1(i1 %val, ptr %p1) {
; CHECK-LABEL: test_store_i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movzbl 4(%esp), %ecx
; CHECK-NEXT:    movl 8(%esp), %eax
; CHECK-NEXT:    andb $1, %cl
; CHECK-NEXT:    movb %cl, (%eax)
; CHECK-NEXT:    retl
  store i1 %val, ptr %p1
  ret ptr %p1;
}

define ptr @test_store_i8(i8 %val, ptr %p1) {
; CHECK-LABEL: test_store_i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movzbl 4(%esp), %ecx
; CHECK-NEXT:    movl 8(%esp), %eax
; CHECK-NEXT:    movb %cl, (%eax)
; CHECK-NEXT:    retl
  store i8 %val, ptr %p1
  ret ptr %p1;
}

define ptr @test_store_i16(i16 %val, ptr %p1) {
; CHECK-LABEL: test_store_i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movzwl 4(%esp), %ecx
; CHECK-NEXT:    movl 8(%esp), %eax
; CHECK-NEXT:    movw %cx, (%eax)
; CHECK-NEXT:    retl
  store i16 %val, ptr %p1
  ret ptr %p1;
}

define ptr @test_store_i32(i32 %val, ptr %p1) {
; CHECK-LABEL: test_store_i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl 4(%esp), %ecx
; CHECK-NEXT:    movl 8(%esp), %eax
; CHECK-NEXT:    movl %ecx, (%eax)
; CHECK-NEXT:    retl
  store i32 %val, ptr %p1
  ret ptr %p1;
}

define ptr @test_load_ptr(ptr %ptr1) {
; CHECK-LABEL: test_load_ptr:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl 4(%esp), %eax
; CHECK-NEXT:    movl (%eax), %eax
; CHECK-NEXT:    retl
  %p = load ptr, ptr %ptr1
  ret ptr %p
}

define void @test_store_ptr(ptr %ptr1, ptr %a) {
; CHECK-LABEL: test_store_ptr:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl 4(%esp), %eax
; CHECK-NEXT:    movl 8(%esp), %ecx
; CHECK-NEXT:    movl %ecx, (%eax)
; CHECK-NEXT:    retl
  store ptr %a, ptr %ptr1
  ret void
}
