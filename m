Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2593859C9
	for <linux-coco@lists.linux.dev>; Mon, 11 May 2026 21:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535194; cv=pass; b=ZgRZE/D3KMIVoLLXlSRfmmBCLj6I1IVJ31aeijJcVterNJBpuxMD0WW+cdlfh7ZEv7wm70zZ3N0Ftc4GFoxa9WRyEyuWy755JbQV6LNNQ5wxFwXJlgmJ+qvu1C3UQ4vNl3yN3vZpqTRmO5Exl509kPRiU0a7DkOpGH095fk/Nr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535194; c=relaxed/simple;
	bh=OUvbBts+AmfVJjAAqbTd6FzJIxojtNvdGMReKsNqD9c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nJ/vR57N7p934Ucw3EeUqQf/vNXihwykw6Pq0Z6PsE/0PwWXJdOyPjXgdKxYKU1psekhnwzrPwFrg70xGi6rbd/67MjXHjn+TFLahxAxxj7HLrpB9XyYRgipVNPREQm2XoPTya5yAVxxXAf+8Uy97Wj+kVqb98d9+NpdniTZMno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8tB08qj; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8tB08qj"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dea1272943so2633512a34.0
        for <linux-coco@lists.linux.dev>; Mon, 11 May 2026 14:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778535192; cv=none;
        d=google.com; s=arc-20240605;
        b=lyO04r69XkOvrLHMmLGhYTbLZXSHt3NJGWZSSYqAw1i2GcvCy/L1Qp5Q1jAS289Pr+
         hmhcMfb8H+YxYTqUheVPeRzcd3dNqA6fMTegqrpP+Ot1gKSW2PGgss3IAKeOlOTEh/iS
         Xc33E9aN7kpVddSiBXaM16280vfK48Vg0Xu7WvyFZM6nzyhAtfHq4iddPvkcyTtdyf93
         5++jsu7D6BvXId5pgxC9emqIADCOHZcZEp+GJD5J5xXKXsf28a46AIh/AJRsdM+QlsYo
         1ehYzo9xKMcYWo4XaXm1S/z3ootz/cKTYuWqM5HsP2qXckjh+l9PTdQtZrVgm9Yvch1S
         tGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=KesVZXgGayz8VlEfcs4ATjAvPhSFjzLMGZQiTnYubOA=;
        fh=6gbJaI8Rg2mswjSP642IvefJS0T3CeQHscP7hq573r8=;
        b=GFHxfNLr4et+mnd62xc1L1ylD+lqttmDmJuLA4OmN2eH+LAZY3O6XOp4WVAzwl2DX9
         bk+F4v+4JYIX5bO3batxfRhbRmAB6CU8gM4EROeW8vaHW9llcDBg17Li3KW9adr/mlqZ
         Cy1Ai9Zp1V9k7aF30Qm12tlfCPSe3yK97MtC74xE3U6CT7Rz2NBh+hfci9nlxLmOmiov
         T6n34onGJn8sA609HPYTj5vMsWT/pTzyI8Cb4Tzc8o1aF81cNQHvGwq+zqpQ9g1WgLq+
         tjxDMYYsJJJyOqTr9WzTwf+Oscq+wNOU3ImUGKex+UUAG3OIFEwqQNvfh5LDZECTqREX
         EjgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778535192; x=1779139992; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KesVZXgGayz8VlEfcs4ATjAvPhSFjzLMGZQiTnYubOA=;
        b=D8tB08qjwlyT8LhU9Mn52Wm4dB5DcvX8y8sjKgRizDQx0s9Ome0S2Z34RvuwYfnset
         nkvWbTTysSdC+n+SDug61NbKy7Vn6dAIU/YwlzwKab8771tDMrtKOj/iDuB1AAz8kxzo
         LX2r/3yQ3Yr/TU+Qr7lQiUCYFPN4XE2e0Dr28vSlRYNGjfuVc9m/IC7IS2N4zCudgyaa
         cm6+iXUrNmV/MdO3zKkM5EIsW9HWR78u3YteljDyymchDl+7WNZl5WKCWQjZCCgLhetV
         d3vpOT1uX8UIt81CquFabWhHgZ/OKtGwjXY/7BF1d3Zh1GyjzN7bC2n6fsoJfoweNOkN
         EWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778535192; x=1779139992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KesVZXgGayz8VlEfcs4ATjAvPhSFjzLMGZQiTnYubOA=;
        b=Wif3CWZp4636L9JHkYqwrn3T3LahJ79/SRZEDojHUbBt3sOQvmDl7XN5mdoOwZEMRG
         su7nBymI6lBMhuDUfP0mUNeTDam1XmcrHTA2keILclyD5vkr0vq06phaFm/XC8MQDWK/
         P+jggJ2l/SAgZ5TBAZT2knIJF5+14/VA2/QDGHFgv38ydvXaPqqMoxVpY/8b/eJB1dJc
         PjQIWkxdFebzDy0o3Sa2IbIu0ZU+g5emkTfjzh4GLLNHKaV2rupfSRlIDYcTNSKrCCJe
         jLfMdg7Hi5DyZ+a6J5V9DPTAjYvZzck03fsiyz+VClT9yqz2Ga40qm5gl6OddT8Lejik
         SkYg==
X-Forwarded-Encrypted: i=1; AFNElJ/hbNrVW1l36MMFm3+3SRynf8j3Dw1DDYFY+Rte4WpgyjuBBdrTPBbhlT4TGHrqQuJwuWW0u7pHBS8d@lists.linux.dev
X-Gm-Message-State: AOJu0YxFvlarUSOyGSwpuAveiaQNaOGQXjBbm6JEkgiGPd24BfE0iK5e
	PmfFlljBoYFa0pk/t4dBgcAkfkbHDCoJDCHrlAPSZYGZgDQaB1dayBpfbiemutdcFeX/3xCohX/
	kn3O8DvJaVSszaYpuBF99s8zH6ClvZdc=
X-Gm-Gg: Acq92OEBPwAO5ZzmCFKTwsvTH9XWp37UXwcraZ0zkxsFjEqB9y8F0DgFH2jTT5yD9+4
	z9xpHcLyraIe9d/JzmiXhqfaZ1sZ2n5IdR6loawqhIxh9jsppJBo7pPlG2XakBsMfmupyWNRQxP
	eaJnumGKUpKpdZFhklTWbLlXrAOSVWSxAflCjEZxFuiGeR8FADufaJqXDIlGFanj8DtCIsezO0U
	iU2lKNVHqDRLXGgYxOCUMA9KVo/ARr1Kc47L4t6mPfS8r8Rfey69BbQ5MhLKBAe7gWFdKtTz9fh
	dYH2AA+f0sbpXoSqRz8of8b3tF1d5nVR7pb2uA==
X-Received: by 2002:a05:6820:1994:b0:694:914a:ebe1 with SMTP id
 006d021491bc7-69b69e6237emr103335eaf.47.1778535192389; Mon, 11 May 2026
 14:33:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: David CARLIER <devnexen@gmail.com>
Date: Mon, 11 May 2026 22:33:01 +0100
X-Gm-Features: AVHnY4JHrtR9s9ws_VGBViP50IT3XLP83fzAEzbiuHq0XPLX5_S0kPMDzhpKQpg
Message-ID: <CA+XhMqzcFRY=ogMhiCQeKqh-zz3RpP0nsUWYhP0jNhF9Uy+41A@mail.gmail.com>
Subject: [BUG] x86/virt/tdx: tdx_offline_cpu() violates tdx_cpu_flush_cache()
 preemption assert
To: Vishal Verma <vishal.l.verma@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, x86@kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, 
	"open list:SCHEDULER" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

  In commit 597bdf6e068e ("x86/virt/tdx: Pull kexec cache flush logic into
  arch/x86"), tdx_offline_cpu() gained a call to tdx_cpu_flush_cache(),
  which starts with lockdep_assert_preemption_disabled().

  tdx_offline_cpu() is registered at CPUHP_AP_ONLINE_DYN. ONLINE-section
  teardown callbacks run from the pinned per-CPU hotplug thread with
  preemption and interrupts enabled (Documentation/core-api/cpu_hotplug.rst=
,
  and cpuhp_thread_fun() only disables IRQs for atomic states).

  The other callers =E2=80=94 tdx_shutdown_cpu() via on_each_cpu(), and the
  crash path =E2=80=94 satisfy the assertion. Only the offline path doesn't=
, and
  the splat should fire on every offline once the TDX module is
  initialized and the done: path is taken.

  Wrapping the call with preempt_disable() / preempt_enable() at the
  offline site keeps the contract for the kexec/shutdown callers.

  Not yet reproduced on a debug kernel; reporting on inspection.

  Fixes: 597bdf6e068e ("x86/virt/tdx: Pull kexec cache flush logic
into arch/x86")

  Cheers,
  David
