Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604790;
	b=znsHKObpBgrG905W4QDOzGIM0NOYZwZp6UrpKJEninMoRoJQZmRIADlGctNUQnHjdDbj
	 aLRWf5nzBwMbcJ++4eVmJQF71HWnRI/fdOznYTflnQOKBI5N0NgZbTxeaM7Pp1OYSpwNb
	 HVzgBnsKke9T0iDZ5v0ZjK4wP8oSoYxt5/AA6nhELNc79IVjVQLzabublNUlhdKRC7R1z
	 Ak6SLuHTDCoUWKhPxjP4Z9B3a5k5WnwWWqv/QD0v6f5MPW0AGgXVHOOVZZSRlZkkQrbVW
	 7Dqf2Q5ynq+obBvgvunm5+t7UckqFi9yWiOB63p931r4psfDkhMn7FSYkypRA6lRUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uhlq7lRBnMZgN/FlVC6dxixNTQE9Qh0fbitp0y0qEhA=;
	b=3iEePYsMenHNa1XewbS64K3a+msf6cor7BnP2KmrHFbEU5l+0hO5fuBnVMTpckvdAon9
	 wAAbVKbfcyqs/j0zBqVbqdBrWI+Pf8+iY9EhafEJgCFo8RzFQ1gkr/v/JNjKzxANrTf12
	 HGa1urYVscW7QSyPoIyfbI+uygvI1zdRy8lITe1/eWXHGTrr9cJeNp/rj9uUWI217rSSl
	 BXzgNWxFr9dqhHXoC4VFsLnekpu/ciggL+ANDMG8H0HqfLNhLB7GZBf+XRb0CoBACgu4o
	 +yX7U78avrp1W9eha4zb688O8+VUZiKGxulczahRT/TQvH2wDX0/O2ogH6AbHRIXXJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBxHRawa;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A26606A339
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 07:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A26606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBxHRawa
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-89d6bd67045so1239962b3a.0
        for <linux-coco@lists.linux.dev>; Sun, 01 Nov 2026 23:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793604789; x=1794209589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhlq7lRBnMZgN/FlVC6dxixNTQE9Qh0fbitp0y0qEhA=;
        b=DBxHRawa6TYdvavSg3FcztrsikcMiHn/ZHdNcnepYIZjNJzCQcwvU3Q5LCEjEDfr3R
         RugAWttzSHSJjXaqsLXGuS7VewVjTxlGkxeziAC+s1UT4maJemxsF9TKEjSIbSWgM1Nf
         ex5s1edOZFJXyuEJgggft8LGWA78edusIkrekPfpmAi+/ismD9tiM4/RxZXAaWTlFDs7
         iGlOqoiLAMZOznJWswJxrc8fwPFJHm76pgVeUou90MQ5hewZKEaviCcVqsnyzCE1Hs29
         apCXjs9iBSepQxUTg0HHFFWe2gdp1F09LXgXCoPlks36oJK0xApXiXUgNEEcRib2yf8D
         D2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604789; x=1794209589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhlq7lRBnMZgN/FlVC6dxixNTQE9Qh0fbitp0y0qEhA=;
        b=Tq8MgnAmHVyghxS2DCncEji1VK0mNP4VvrWwagTx3y2uh5FBPlKrJ9aVJvz2QLboEC
         J5t5blU5ju35Ho4JwzTBrgALGmJnGihY8mVra0WAc2V9UzilIw8P/TOg+W9whT5tEUS3
         wLuaCsDqaaf2QHZgqfBlw7XZPKUMZHB8G6oNQe1GdkFSEfHkDw/DmSss90dpUA6nS+pe
         cyoxqjxZkKPR/T7VoAEFzaeEQALI2Goeb3p9LvjCXwyraqTntY9uscDw+hkvJ/6Liau/
         mCLRdNmKB8mkaHUVd572yXCIfOTOzi0v5yiQIjDMxNkoGv0tlUarwBl6izFXoHRChc+F
         T6lg==
X-Forwarded-Encrypted: i=1; AKwUvBwqOe3IL40JyjXRvfUlEideJYwTzJmtAhmkx0pVwVS2a2M1CCS4LMaTYCLe2oYTUsNDn5lSTC2AbLAM@lists.linux.dev
X-Gm-Message-State: APuU4Z8BYFKmZ8VfZT9YFa8gmlkndM4skMJenPvXUiPD1FTtoQMmiPiz
	2mI1IfHhQPYNRfSPMWQBM0N96awlm6bhup2GdyKJL/pYayKSKGnbMJVlzmuqNweYVEI=
X-Gm-Gg: AYBFou3zklfoZYptnew/E4fnqXyeNBmNb3Xly6VwvIoDrDvo97y9wVUGcOOs2iJ8nzC
	vifWhe7jo2/4N9rYmxUSeE+tz7AApLKWkDiXVMV0bhXNKeSzfmrXwTx2sHttTEFyvDxnl7vu6KM
	Z61Tqa9SDOxViC7wfDOl5qn7xUyuJr3CviSWjIzdIhhewcanqXmFZTMKZPVwz31VCGQTfFvvoNy
	E3gJteF5WuTpkg6fSoM535gWOW0BDhgxKckNAeozuCzFYsqyKuyo1yqKSubaaMzc1Y9D+ZrxeBC
	0pIO2Uv53I7uDhfpaY/durRERWA6PeSYrhflMs4ZqxF5+LYRtSMAXKVm2hm32Cb8uSi6MsskTHD
	chHmjr6Ro7y1nFZKSraNNUdtLLRqiF3hTNqiXerX9ddL0V5yqlQIZ4D5pslWp6EjZUhCFC9NF/W
	SDXkmzeULmnwo2P3BUPD0Z+LPXrFY6hkIwlMi1DiDJxR30XwWv1f3sL3a1qpzLALKF+k+MOoOnY
	tz6GRgo4sjV5fcK+EGc0rQ962KvpxCmGc6kXi6tJlim4ZKja+77JJXYGER/7x50HFaWImuWmzUh
	ipxGCfcdhTo/GKvjXhogTkKI8SlZULkPa2j+pYdDQ8E=
X-Received: by 2002:a05:6a00:340a:b0:89f:d449:7526 with SMTP id d2e1a72fcca58-8a8321b41acmr7898596b3a.21.1793604788690;
        Sun, 01 Nov 2026 23:33:08 -0800 (PST)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada6c2c28sm1563174b3a.43.2026.11.01.23.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:33:08 -0800 (PST)
From: Challvy Tee <challvy.tee@gmail.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com,
	vishal.l.verma@intel.com,
	kai.huang@intel.com,
	seanjc@google.com
Subject: [PATCH v4] x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module is not initialized
Date: Mon,  2 Nov 2026 15:32:44 +0800
Message-ID: <20261102073244.919864-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <07cfa95a-e766-411b-8765-33352a04c0be@intel.com>
References: <07cfa95a-e766-411b-8765-33352a04c0be@intel.com>
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
kdump") made native_machine_crash_shutdown() call tdx_sys_disable(),
whose only gate is compile time (CONFIG_INTEL_TDX_HOST).  A kernel that
never initialized the TDX module therefore still issues
TDH.SYS.DISABLE.

In VMX non-root operation on a SEAM-capable host, SEAMCALL causes a VM
exit instead of a native #UD.  KVM injects #UD only since
commit 9d7dfb95da2c ("KVM: VMX: Inject #UD if guest tries to execute
SEAMCALL or TDCALL"), first released in v6.18.  On an older host the
VMM gets KVM_EXIT_INTERNAL_ERROR and the vCPU never resumes, so
machine_kexec() is never reached and no vmcore is written.  Kdump is
thus broken only in guests on SEAM-capable hosts whose hypervisor does
not handle the exit; plain kexec is unaffected because tdx_shutdown()
only runs as a syscore op, registered after init_tdx_module() succeeds.

Gate the SEAMCALL on X86_FEATURE_TDX_HOST_PLATFORM before issuing it,
the way paddr_is_tdx_private() already guards its own SEAMCALL in this
file.  Without that feature the module is never initialized, so there
is nothing to disable; on a TDX host the gate is a no-op.

It also decouples kdump from the host KVM version -- a guest cannot
require its host to inject the #UD.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v3 -> v4:
 - Gate on X86_FEATURE_TDX_HOST_PLATFORM instead of
   tdx_module_state.initialized, guarding the SEAMCALL itself the way
   paddr_is_tdx_private() already does, as suggested in review.
 - Drop the v3 rationale about covering the syscore and future callers.
 - Retested with this predicate: kdump produces a vmcore on the
   Alibaba ECS Emerald Rapids guest (6.12.0-278.el10 base).
   v3: https://lore.kernel.org/all/20261030154851.907726-1-challvy.tee@gmail.com/

Hypervisor -- KVM on all five (CPUID leaf 0x40000000), across three
clouds: Alibaba Cloud ECS, AWS EC2 and Tencent Cloud CVM.

Host log -- yes, from the Alibaba ECS host of the Emerald Rapids guest:

  KVM internal error. Suberror: 4
  extra data[0]: 4c
  extra data[1]: 2f
  RAX=0000000000000045 RDI=0000000000000045 RIP=ffffffff855422fe
  R12=8000020300000000 R13=8000000300000000 R14=8000020200000000
  Code=... 4c 8b 5e 28 <66> 0f 01 cf 72 05 ...
  check runstate transition: 'running' -> 'internal-error'

Suberror 4 is KVM_INTERNAL_ERROR_UNEXPECTED_EXIT_REASON; the two data
words are the exit reason (0x4c = EXIT_REASON_SEAMCALL) and
last_vmentry_cpu, i.e. kvm_prepare_unexpected_reason_exit().

RAX and RDI hold 0x45 = TDH_SYS_DISABLE and RIP is at the '66 0f 01 cf'
SEAMCALL opcode in __seamcall.  RAX still holds the input leaf rather
than a status code: the SEAMCALL never returned.

Reproduced with 'echo c > /proc/sysrq-trigger'.  All five have
CONFIG_INTEL_TDX_HOST=y, kexec_crash_loaded=1, a kernel changelog
naming both backported commits, and "TDX not supported by the host
platform" in dmesg:

  Microarch          x86_vfm  Cloud          Kernel             echo c
  Sapphire Rapids    0x68F    AWS EC2        6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    AWS EC2        6.12.0-278.el10    no vmcore
  Emerald Rapids     0x6CF    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Tencent CVM    6.12.0-278.el10    no vmcore

That dmesg line is printed by tdx_enable() when
X86_FEATURE_TDX_HOST_PLATFORM is clear, so the feature this patch tests
is absent on all five.

Controls, each producing a vmcore: the same platform on a kernel
without 5b25f249be32 (tdx_sys_disable absent from kallsyms), platforms
without SEAM support (Skylake, Cascade Lake, Ice Lake, AMD), and plain
kexec.

With the gate applied kdump produces a vmcore on the Alibaba ECS
Emerald Rapids guest, retested with this predicate.  The Granite
Rapids guest was verified with the v3 predicate and not re-run; the
AWS and Tencent guests are reproduction evidence only.  No TDX host was
available, so the no-op case is reasoned from the code, not measured.

 arch/x86/virt/vmx/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..9b01131f7b7b 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
 	struct tdx_module_args args = {};
 	u64 ret;
 
+	if (!boot_cpu_has(X86_FEATURE_TDX_HOST_PLATFORM))
+		return;
+
 	/*
 	 * Don't loop forever.
 	 *
-- 
2.52.0

