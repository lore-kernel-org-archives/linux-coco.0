Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC255472760
	for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781632287; cv=pass; b=DaGpw6Klj0alEE5hhumFuqatc5mEpBNBviqG9qZqBY1FHZgZyZQAsTOhUzhFd5s4HJma45AUNTY24Pc2P26V8YenSBe4kS1Pc0HjVO9kujxZH/qo1g3gNZQLxfmqGZ3O7uQGUfCmv6R3T/51Vt0SdeS6L6Lbu6wQrsYdKG8KXpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781632287; c=relaxed/simple;
	bh=p2ANGxzNJ20KDUvX+I4Q+f5qJmFbZs4+5xfreNmKUKU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b63swfTZpl4YKzJbHQE+HRCzYXGsRM7hWwBz79ewAJ+eYnUErrQJybL/9mngswKl63URkRRF//KkhDi39NXUn51RcmKtvDfChWth8f6X1VxLtuMeqIcHExMzmgjbQ+2wFt0TXApWaQWfGO5Xxi/VAaencMyHE0Vp9gqcziedYS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ji92PBuk; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ji92PBuk"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13986d61b4eso2378351c88.0
        for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 10:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781632285; cv=none;
        d=google.com; s=arc-20240605;
        b=jTDDiNi/i8EC+YF3k+13PSFFOIqtO1DS8u2EgjMuEw4Zn906eU97Wj+lWF+BNItzdI
         umZMHUBDsknQvHggrLQijpqxJDjNnHOw3xOp5/PXspBJ3nwWxPHUyz9vcLGW0augHOxJ
         5ab5KaXz/+W7oYYRGQCk13QPRermYC+Oh+tknpTWMOpNWG/7P+sAAWpzbusasQxnM8q4
         3RYOKOlYLSVosc6N+ASmEUtXVqveAbgT2X0RzZ8nzsP1o36UAvXXpbNm77XeVNVgQIuk
         DhTBWiMAv4kADdcJf8OnHVIedqyhGmN201EpcYw2t/mDGrCeHif64Ux1w68l/uvGsyOD
         zRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vAJ+Zx927BzPJvAUqjNTscby/9Gt71bp8RVRdDOhQVA=;
        fh=tiru2BOJ/PR1jE9RrVxr+p5yxhJEYkFMUPzSxXMmQ3U=;
        b=DeBRJsVzJMUW7g0Rg5ToyqBeXum8jbn8sSm2tJJhPoDPLWNjTBSDnneI1XnpmJ3fMr
         HkPRqW2jBwlCAhdMMmoG1t9jPtIpPT+zEUwIXIupSKT30wn4spDR4wKRndDN+BC4cA+/
         pkmHDldOAYLOOvAVYQR5fMBZ7H2aMtdHz0MLtuYEP2vAHFBstUbbvmPWIvpYDfEAeFG6
         iNJ3lPWuXn247qxohE6hfhIgAiHc0UzRcR8f2OiZSfOxNEaO8331gPGUJqiotOPLfYyw
         cqvNJUqgUqsF2zoXYpvlGh/5+uM2gPeTOTDoUrYV6afbQJb2uYZE1zTYMNhmtAJnN2hn
         G54Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781632285; x=1782237085; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vAJ+Zx927BzPJvAUqjNTscby/9Gt71bp8RVRdDOhQVA=;
        b=ji92PBukPdWxrml7y7UBSunZRfHoRy1y5oCjrmWstn8Evw0eGdd9JOcsREgYMaUKPx
         sIBvnRmJMu338NC8GkI2zu7YFabJam440W6RNCmIqNgMFPoALDJH5rcQiw+fgjglQx/J
         Ri2+BGpGMtYm8hiA8TKJgSok2gwCNCTnNT+N08x+xjSHRsBgXDgbbI4QRK4f8hci0Ehp
         xwP9PgEAREAYtzKhxq64zUAKEEPLWsuG1Fz9tG/dYIoC+7orWn/uYW2D7j6aefq8JvNd
         WfoX0PzcGOpvhmk8G61OANZ1K5C7CIN3Mkwb7mlu7UeSsoRZaKbtVvQwjJOHQGGmce6H
         D/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781632285; x=1782237085;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAJ+Zx927BzPJvAUqjNTscby/9Gt71bp8RVRdDOhQVA=;
        b=UN0ZLrGHmukcPn8LGDpWgPykWTcBcbJjqTUrEn/1PfzF2/r0bhCJVgIqSv79JIXvuY
         JdIuXzdfGKzUZ1XrcGi0LXfEqLHysf0fXWXN6kA6m1O7AxYIsya5pt9vs1CzkeDFYiDT
         xSZJkdu3/2ps0s+Ag2xI9NV3FyLhdw5uWhYOAYVs14qyYXmKNEB85AEax7MjPoOcmV+N
         MSl+b9oAoqyq4SLCLDv/9S/5ZJyVyuGWqw9ksiU1++TMxJraSZvPGRUIo5U0TZKpIPuk
         S2+mGvN6oAxZdZRAiI8Trm4PIC5/gwPr6DclagmdCw6Wknaszyh4NK+JmHUSRXw2HzUL
         KJqA==
X-Forwarded-Encrypted: i=1; AFNElJ+7VzPaQIq2CI5r+ubuCrbGJ9BXFwWj+0eC73m8qFjmcwW0NekYaB4U10uaggf6q0/oVug4xSdll86I@lists.linux.dev
X-Gm-Message-State: AOJu0YxyMDekEWmN2Dv8W27vHMohs1Ow6oyYl3DjNWrI3scxM4ardOD8
	6fnq75OK9Bj13oe9uWmPeK3TKUpAk/4oa+IA0MLn8zFUo6J+IHcCNtTwLmmARwqlYex+68XMBtV
	mrAOQ5GTJkG5Zt7/Xha87AsmBKPxvPtoSSzpGO8lt
X-Gm-Gg: Acq92OEN6/SIIAIdZ50Wvlh+mP4oP2//sz6bxIZ+qXdgVNFS317LD9SglBfIXvSuVuL
	UgDvk7r4FqoXTjJnOLqaYPmjGgBFzmS0fgw4ia9kmXU+r8+JJBFlvNIbVv5TOLFCndmawNPZPLJ
	/TXjS8F0YJpStPl8yutTLQeNcqHuDbfEfldS44RqDvSwwY0ojEUOUPfXSExjgkQjV9CLPQx8xGS
	Nj/3a8br2JKMAopSLqraS/pv3Dn/EUZeEHfUqqXweFcrK3TENV/+5SsxdxjXqmBo4rOLnDgxmUJ
	iXQC11ZlzXOeMSWzAUFiewQ5H19gU+rIQ5c2+4O2QXxxydnjLooZT7gfkGV7tXn8BnmyBg==
X-Received: by 2002:a05:7022:6890:b0:12d:c730:c7f with SMTP id
 a92af1059eb24-13985f391b7mr2153523c88.33.1781632284036; Tue, 16 Jun 2026
 10:51:24 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 10:51:23 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 10:51:23 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 10:51:23 -0700
X-Gm-Features: AVVi8CeVvqhvGF5MX5YfSPvn-N1x5SmL7ZQyivueF-K8QCQbzjfdjv9TTd4B_6A
Message-ID: <CAEvNRgH7Lk=z9NqcY4OZXv=y5SeCZHnDNcB0=kHfarjCA4ZPTw@mail.gmail.com>
Subject: Re: [PATCH v13 00/22] TDX KVM selftests
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> This patch series focuses on setting up a TDX VM and adding all code
> necessary to run a basic lifecycle test.
>
> Unlike standard KVM selftests can set up the VM through guest registers,
> TDX module protects TDs' register state from the host. This feature of
> TDX causes problems on VM boot state initialization and the ucall
> implementation.
>
> In standard KVM selftests, the host directly initializes the guest state
> by manipulating Special Registers (SREGs) and General Purpose Registers
> (GPRs) via IOCTLs (KVM_SET_SREGS, etc.) before the first KVM_RUN.
>
> To bypass direct register initialization by the host, we utilize the
> standard x86 reset vector as the default entry point.
>
> The mechanism works as follows:
> 1. The host places register values into a specific memory region and
>    inserts boot code at the VM's default starting point.
> 2. When the VM starts, it executes this boot code to "pull" values from
>    memory and manually set up its own SREGs and GPRs.
> 3. Once the environment is ready, the boot code jumps to the guest code.
>
> The standard x86 ucall() implementation uses PIO, but it does not
> actually transmit data through the 4-byte PIO data. Instead, it relies
> on the host reading the ucall address directly from the guest's RDI
> register.
>
> TDX selftests cannot utilize the standard x86 ucall implementation,
> because the host is unable to access the guest's RDI register. Based on
> this restriction, we considered these potential solutions for the TDX
> ucall implementation.
>
> 1. TDCALL PIO with RCX-bits Passthrough
> We first considered passing the RDI value through RCX bits to bypass the
> hardware's register protection, which could be the closest approach to
> the non-TDX implementation as per Sean's suggestion[1]. However, this
> approach is blocked by the software-side implementation: KVM_GET_REGS
> currently does not support TDX VMs and returns -EINVAL. To make this
> work, the KVM ioctl would need a test-only hack.
>
> 2. TDCALL PIO with buffer indexing
> To keep a PIO-based approach and unify the get_ucall implementation for
> both TDX and non-TDX VMs, we considered TDCALL PIO with buffer indexing.
> Since the ucall buffer is initialized prior to execution, the VM could
> just pass a buffer index rather than an 8-byte ucall address to fit
> within the 4-byte PIO data limit. The host, already knowing the ucall
> buffer's base address, could then resolve the ucall content via this
> index. We abandoned this solution because it would require changes to
> the common ucall structure and impact other non-x86 architectures.
>
> 3. TDCALL MMIO (Selected solution)
> We ultimately selected TDCALL with an 8-byte MMIO data. This method only
> requires initializing an MMIO GPA and adding TDCALL MMIO implementation
> for TDX under the original x86 ucall path. While this diverges from the
> non-TDX PIO, it provides the cleanest implementation with minimal
> disruption to the overall ucall architecture.
>

Sean, Lisa evaluated your suggestion [1] (summarized as 1. above) but we
think TDCALL MMIO is better, what do you think?

+ Jump directly to where the mmio is used: [2]
+ And here's [3] how tdx_mmio_write() is implemented, with no more
  throwing everything in a structure. It's also not macroed/prototyped
  like you suggested in [4], but I think those prototypes can evolve out
  of future tdx functions?

Let us know so Lisa can try another option (if necessary) while we
collect more reviews :)

[1] https://lore.kernel.org/all/aQTcDH9LRezI30dm@google.com/
[2] https://lore.kernel.org/all/20260521-tdx-selftests-v13-v13-21-6983ae4c3a4d@google.com/
[3] https://lore.kernel.org/all/20260521-tdx-selftests-v13-v13-20-6983ae4c3a4d@google.com/
[4] https://lore.kernel.org/all/aQTdTkMIukzt-YlA@google.com/

> 4. A note on #VE and x86 ucall simplification
> It is worth noting that the use of a Virtualization Exception (#VE)
> is orthogonal to the PIO vs. MMIO discussion; rather, it is a question
> of how much we want to simplify the x86 ucall implementation. A #VE
> handler is one option to allow VMs use PIO/MMIO identical to the
> non-TDX case. Alternatively, having an MMIO_WRITE wrapper macro, as Sean
> suggested[2], is another option. Either way, discussion for this is
> likely a premature optimization right now, since the PIO/MMIO call is
> only used under ucall_arch_do_ucall(), and standard and TDX VMs use
> different ones now. We should optimize this in the future, but for now,
> invoking TDCALL directly is more robust and concise.
>
>
> [...snip...]
>
