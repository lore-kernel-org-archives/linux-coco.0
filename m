Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267240;
	b=Va+WHDAIAhVoUS0LjTrgvfngYK2ncoax0MBiCqKRLCZSDt5XdTV0SgbJAOY+qKj8KsmI
	 74/Of7u3XZdjjgoDV1/Ah1YtOC5PHdahVTt8P/eAHSHhYIMfjkjKtDuFXuqmRfA5nHOyt
	 kaK6UaizmGa7GrZSI9xiYLGqsqnn/tmuPZh7F2V5XAuXFO6I6bFfRCWcMuiPD2T+UixL/
	 vVNoIN+Y9+CUpjnY6dsO4K7WL0SKOtehDUWLllqy5k4IllseyGjVDIKn/N3tfLJxPNPKR
	 WYq4KfwHfokesD7EVwaMvzl9ooRIEYsz3X1DZhZPEUE1M/wCDADPdTX8Wgz+5a56gHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ln7ETxCnDGUOhcBIhAMeXSU0zs0khHi7wfl/J1q2waY=;
	b=miHqLCQfL92uYVi53qt1SBNJnBW17vkZUnriOeicdx1oExofTLZjxrXvLWiGQ94+MQsB
	 hNBPQB1DnfDNhBvYiw/2TjkJYfM/YDKgGxVRWD3Vlb3wDMwVlrEkLUUbfitiBWLCkYhb4
	 BAUCt2w8zoimOYpnAIKaKQRp9mrUw41msSoqt1CtgNUyRd5KU/KKaLT6Ia+SGpdaeMuJP
	 JmQoHv50s89P+yraiJ2ZMYlAr1aQSKCLt23ACxU5fOcCxKUJi6UT5hPtSptAFSuMyvssf
	 byjNSDvhUHRN89DlL39A/KcXaL9RQgetVr+lEGEqCQw0ULykcaxkKhcNxERVkLRG7cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ma6mMbWu;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AAB606A320
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 09:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AAB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ma6mMbWu
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2403056eec.1
        for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267239; x=1793872039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ln7ETxCnDGUOhcBIhAMeXSU0zs0khHi7wfl/J1q2waY=;
        b=ma6mMbWuOGKIhwn/Cj9IbKRoAimpPQyOWVQ1ipTh1+tLhgnRkiJPJtbKMPJ4jkiBd6
         hxCr06bRF4A8vK0MY1bxYsgp/hwt2jbdpuUZqPK7n1Z6FECjLX+NWqipG2G6hgV11Aod
         kZ/w7AU8mBy6X2zMoa/RPN4tvd5i6x6KL5RA/OKwrFCFK2unQgUlY+WXuubUB9+bEu3I
         nESIxq3FuVYtLFOXIm/bbd3TSot1etUB3tkryHIUVO+pQ8iOVoS2u8+pU/MRA1prikkk
         IxIla8BksVeIg2Ac73wbuFQ9IK4hMzW0ipm8Fhr4NCn92UKpeM4PFC2VQLRO0CdGiy+3
         g5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267239; x=1793872039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ln7ETxCnDGUOhcBIhAMeXSU0zs0khHi7wfl/J1q2waY=;
        b=yt3nWkQ7PAbU2DXTHl0V1IZQWx3cRkBG+iKmIaTMRyrhAFhVoSdDMxtIfdDfv8wegb
         pDhL7xoEUrXy4xfP3sfoskoW9cU/jhusMJu3YflsqMDS5ur3FOpnBeg4qq76ahFhYhiL
         UmewRXSjp/ifJGmApCbFaUwQapbI0X5zmBksZZkWh95CvKscsomFw8mpSm6rSl3soaVY
         iCcZLe/eGf4L9x+9Ai9YmScrndw81ybQFeCUinf6s5jmY68WstYtIB62TO0guDN+IGOY
         8IfTNSKy86saQfwtknvm4mAa50CyB2sP9c6cJUuaHTuEp0C98cQKfAquZGzf2vui3igt
         OlaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCjuF/eJOW5fJwDAdqYLfq9PhYwNY9YrJ7e56WESUW5b9Yk0jlvUeITedt58C2JToqwhKuzNNLvqS+@lists.linux.dev
X-Gm-Message-State: AFq9FYIq8UHHCMbA+Db5nQ6E/bQCFRQHMNLemCTzH60rqz7WE/RZjv+y
	JSToFY4puWOGbFGTnqRxQg/OpCu6eOtQaiW3tSDzHsak3Wzp/+Zn5OD7JBxnyq4oDXA=
X-Gm-Gg: AYBFou08APT01WHqDv3gIiydLIDSC6Uf2LC4BmI8llIbo/z9m4BCUhq/FA0+00XVsQc
	4bCqigzyfRIw1aRfjnuYgSFjyvIPiPkbyya1y5eoF7JEi7tBztFMBip9iMit1Y5cYWlIL3tLxsC
	OhBLiA12+7y74H2AIV6U2AqdiO3cp/CkLpi6UtroX5gKs5gaSchh0aMKEV8gj/d4VMJDKDXXKVY
	52GyV8T1x9xI7pr/gOIDTcRAhR1Pc/AIEpQap+pj5+uzy34WUrBXw7sAzrmY/Xoki7DXIPENbMf
	FdQFmojHmYiAZ10BYmTP7TuXtFyxJpF5jEJgIQtqFxEhz6kRn1e3BnBEGqadiKDDT4iysgw4M4o
	azoiXsCs7WFmbZXYIU54t0/jOosoB0Ry/a8KB9l0DUaq5d8g/xI3omOAsPJ3PGpdvdJwPjd032W
	/gt7ISt0Qt91NRSwomZZ1gGaGMxouKK+suYjfJJrCm/lPtES0gFFUSUdBXGztnP3qYn3EzKJ+uo
	rTQJW0pbDax/CRwo4Eu3S0uvJxwlI8r121xuzMK0dqyTl0TQqIuo3nTCmuaSOZhzSLdAaf9T3QY
	HlS5sfzTPlPFvL5WPI2zOdGKpsyEsZ2YxLHKbhoyOA==
X-Received: by 2002:a05:7300:d80e:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a1ff846e3mr7012686eec.1.1793267238675;
        Thu, 29 Oct 2026 02:47:18 -0700 (PDT)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237bc445sm14464245eec.1.2026.10.29.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:47:18 -0700 (PDT)
From: Challvy Tee <challvy.tee@gmail.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	dave.hansen@linux.intel.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	vishal.l.verma@intel.com,
	kai.huang@intel.com,
	Challvy Tee <challvy.tee@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module is not initialized
Date: Thu, 29 Oct 2026 17:47:05 +0800
Message-ID: <20261029094705.896693-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261029080731.890996-1-challvy.tee@gmail.com>
References: <20261029080731.890996-1-challvy.tee@gmail.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and
kdump") made native_machine_crash_shutdown() call tdx_sys_disable(), but
tdx_sys_disable() has no runtime gate: its only guard is compile time
(CONFIG_INTEL_TDX_HOST), which is enabled in most kernel configs.  On a
system where the TDX module was never initialized, kdump now issues a
TDH.SYS.DISABLE SEAMCALL that it did not issue before, and the crash
path never reaches machine_kexec().  The capture kernel is never entered
and no vmcore is written, so kdump is completely non-functional.

Having the TDX module uninitialized is an ordinary state rather than an
error.  tdx_enable() returns -ENODEV early when
X86_FEATURE_TDX_HOST_PLATFORM is absent, and it also bails out if
init_tdx_module() fails.  Any guest whose host does not expose TDX is in
this state and logs:

  virt/tdx: TDX not supported by the host platform

The syscore path is implicitly protected: register_syscore() only runs
after init_tdx_module() succeeds, so tdx_shutdown() cannot be reached on
an uninitialized system.  That is why plain kexec still works and only
kdump regressed.

The crash path calls tdx_sys_disable() directly and bypasses that
protection.

Reproduced with 'echo c > /proc/sysrq-trigger' in VM guests on Intel
Sapphire Rapids, Emerald Rapids and Granite Rapids platforms, in every
case on a kernel that already contains the change described above: the
capture kernel is never entered and no vmcore is produced.  With this
patch applied kdump completes normally on all of them.

Three negative controls, all of which produce a vmcore as expected: the
same guests on kernels without that change, guests on platforms without
SEAM support, and plain kexec on every platform tested.

On a host where the module did initialize the new gate is a no-op and
TDH.SYS.DISABLE is still issued, so the poison clearing that the above
commit was added for is unaffected.  We do not have a TDX host to test
on, so this part is reasoned from the code rather than measured.

Gate the SEAMCALL on tdx_module_state.initialized, the same predicate
tdx_get_sysinfo() already uses in this file.  Putting the check inside
tdx_sys_disable() rather than at the crash.c call site also covers the
syscore caller and any future caller.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v1 -> v2:
 - Use the real commit id 5b25f249be32 in the Fixes: tag and in the
   opening paragraph; v1 went out with a placeholder instead.
 - Drop the claim that nothing reaches the console.  panic() prints the
   message and backtrace before __crash_kexec(), so they do appear;
   describe the failure as the crash path never reaching machine_kexec()
   instead.
 - Drop the paragraph that explained why guests on platforms without
   SEAM support are unaffected.  It asserted a mechanism we have not
   verified, and the negative controls now carry the same information.
 - State explicitly that a host where the module did initialize is
   unaffected, so the poison clearing the fixed commit was added for
   still happens, and say plainly that we have no TDX host to test on.
 - Restrict the syscore claim to kexec: tdx_suspend() does not call
   tdx_sys_disable().
 - Resend with the full get_maintainer.pl recipient list.  v1 only
   reached stable@ and missed LKML and the x86 maintainers entirely.
   v1: https://lore.kernel.org/all/20261029080731.890996-1-challvy.tee@gmail.com/
 - No code change.
 arch/x86/virt/vmx/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..a7eae7492c1e 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
 	struct tdx_module_args args = {};
 	u64 ret;
 
+	if (!tdx_module_state.initialized)
+		return;
+
 	/*
 	 * Don't loop forever.
 	 *
-- 
2.52.0

