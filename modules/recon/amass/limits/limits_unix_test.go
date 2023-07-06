//go:build aix || darwin || dragonfly || freebsd || (js && wasm) || linux || nacl || netbsd || openbsd || solaris
// +build aix darwin dragonfly freebsd js,wasm linux nacl netbsd openbsd solaris

// Copyright © by Jeff Foley 2017-2023. All rights reserved.
// Use of this source code is governed by Apache 2 LICENSE that can be found in the LICENSE file.
// SPDX-License-Identifier: Apache-2.0

package limits

import (
	"testing"
)

func TestGetFileLimit(t *testing.T) {
	if r := GetFileLimit(); r <= 0 {
		t.Errorf("Returned a non-positive limit")
	}
}
