Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499D482D70
	for <linux-coco@lists.linux.dev>; Fri, 13 Sep 2024 17:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726249161; cv=none; b=TrnKSwe7Hn+GCvXihmvTXJ/STpdbOlNZVcoEaphovtZ5ofQgtfi9NMYMHkKWuUMN0mgElpgvgSxJ284IJ91KZklqj+VYgA0oqkpl+ci8FCwCC68F4kgtT6xJOKpdpkriNlsBlxHaxws+LNh/EELzCplZHffhzkRAZ0v80tyxxZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726249161; c=relaxed/simple;
	bh=evRLds+DdPC5pyCASAV4XWXLDt2x6Uv90fA6yJV1gPw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bFr9EYKytfTC/qFywUCC4fzf+b3omRCh0+FPm1+yGP/iDacS8NgcJRHniMZUDAVTLfPCg5CZnGU1EBr7jFiP7ts36/Ijt+kA+idxGtFq+YCW8hRaqf1h00pBE8tqs9Ni58ZllDdxmwwOnM6G3jVFQlbmTo83vxnG3CbFdW6lWrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hSh8f+i1; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hSh8f+i1"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71930797560so1963360b3a.1
        for <linux-coco@lists.linux.dev>; Fri, 13 Sep 2024 10:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726249159; x=1726853959; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ba0FHqDBHCbI118uGJsUV1vp4JaUj/8z5TMh6FauZPc=;
        b=hSh8f+i1klRkYi3/uqhUiJrPDKkdR013Ots6Su6w8bbakMMYV3/d/xrw8ine6arDO1
         jSNY1jpM4UgFfMqGjNqiglYAMtZ93IQn3KPl9ij5PtuVZnbjsl1Sm14y5Nqu8xLFj+dB
         aYZmji7g5wlLJ1bJrKNZeX+82zuP4bsFziHnp5Lvn01ksprKs/ASvbYq7dx5U19P5yD9
         59KZaISNY4MCrQ6Aq67JA3vIEbjLohgcTLRQzSwgTWUJBLRvgFXEIFNASg0/eQ7JEbIg
         tmQ3lanhugYFtjkvLiYCdb8IPw5PKfq+XDCo5kgk0COYQlz0cN7naEWtvymzjm8ok1z3
         e7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726249159; x=1726853959;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ba0FHqDBHCbI118uGJsUV1vp4JaUj/8z5TMh6FauZPc=;
        b=Z48Qs7GNNybNrwTJb/gOyxJjbiu6hkPJ3IDkuV66t/LRYKsK+aFtUhdr97RH5YDDbm
         KIrvcXBGtllVawcBP76rjr4QPvF43gcdz4bR9U4OVBU4NnRs9uCm1RloXARZH8p475+J
         5XgaGtYdNasUldG9z4vmqvBqI/zRDS7pFDUscPJx+t6SmZs4prdVtJK3TQL0L3f5lMVe
         syfaWfNeV0ZR8vRvgkZlkxQXwVtx6AOREfHctjIIMP8HFyxip2nbtu+qriVoBbdrWS4z
         2VKOukONn8SK4tYBf+W1RR7uk+GNLgyt2qM6lqL4LAFJlgYUc2jJ0c3bKa/nUTMDsg/a
         R49Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUDgECgFE6vfSdoWS1cGxElmpUZyrspTqJ2VvuXaoxDfpiK6SgFp7EquKBpb4EHVaqpCkb4kRb6o2C@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+7nUjkzS0KzdJqg6ONWAsmVFoAPpTWteSqhGkJJ6poySo3gjr
	ZKnpSCbpMudgUwvipg6rLrgOH+bJCFJnohOGF8CJwj3WjDp6WDlr3Wi3lGvVK1B1SdvMuXEPX5P
	nfA==
X-Google-Smtp-Source: AGHT+IFIw5bwLE9Jkesd/6So5FmVUUhFVWaY5epVthqEhVMkYSprKp3lhtrI3TJV+i3Bx+4kH28A8vyKt68=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f09:b0:718:dfec:9570 with SMTP id
 d2e1a72fcca58-719263748bbmr14398b3a.6.1726249159126; Fri, 13 Sep 2024
 10:39:19 -0700 (PDT)
Date: Fri, 13 Sep 2024 10:39:17 -0700
In-Reply-To: <74fe44da-b99e-4fe6-b07c-43a146184e7c@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <6c158a14-ba01-4146-9c6c-8e4c035dd055@intel.com>
 <ZttwkLP74TrQgVtL@google.com> <d3895e03-bdfc-4f2a-a1c4-b2c95a098fb5@intel.com>
 <ZuHC-G575S4A-S_m@google.com> <h5gp6dgcfazm2yk3lorwqms24c2y2z4saqyed6bnzkk2zhq5g2@rf3lj2a22omd>
 <039bc47c-9b5d-41f3-87da-4500731ad347@intel.com> <2v2egjmdpb2fzjriqc2ylvqns3heo5bpirtqm7cn32h3zsuwry@y5ejrbyniwxq>
 <c0d9ff5f-85d5-4df0-94a8-82e3bf6fe21f@intel.com> <ZuRoE6P3DxxK_3C9@google.com>
 <74fe44da-b99e-4fe6-b07c-43a146184e7c@intel.com>
Message-ID: <ZuR4xUoJRX7gWX1r@google.com>
Subject: Re: [PATCH v6 0/6] x86/tdx: Allow MMIO instructions from userspace
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Alexey Gladkov <legion@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Yuan Yao <yuan.yao@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yuntao Wang <ytcoode@gmail.com>, 
	Kai Huang <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>, Oleg Nesterov <oleg@redhat.com>, 
	cho@microsoft.com, decui@microsoft.com, John.Starks@microsoft.com, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Sep 13, 2024, Dave Hansen wrote:
> On 9/13/24 09:28, Sean Christopherson wrote:
> >> because folks would update their kernel and old userspace would break.
> >>
> >> Or maybe we start enforcing things at >=SEV-SNP and TDX and just say
> >> that security model has changed too much to allow the old userspace.
> > Heh, that's an outright lie though.  Nothing relevant has changed between SEV-ES
> > and SEV-SNP that makes old userspace any less secure, or makes it harder for the
> > kernel to support decoding instructions on SNP vs. ES.
> 
> The trust model does change, though.
> 
> The VMM is still in the guest TCB for SEV-ES because there are *so* many
> ways to leverage NPT to compromise a VM.  Yeah, the data isn't in plain
> view of the VMM, but that doesn't mean the VMM is out of the TCB.
> 
> With SEV-ES, old crusty userspace is doing MMIO to a VMM in the TCB.
> 
> With SEV-SNP, old crusty userspace is talking to an untrusted VMM.
> 
> I think that's how the security model changes.

I agree to some extent, but as below, this really only holds true if we're talking
about old crusty userspace.  And even then, it's weird to draw the line at the
emulated MMIO boundary, because if crusty old userspace is a security risk, then
the kernel arguably shouldn't have mapped the MMIO address into that userspace in
the first place.

> > I also don't know that this is for old userspace.  AFAIK, the most common case
> > for userspace triggering emulated MMIO is when a device is passed to userspace
> > via VFIO/IOMMUFD, e.g. a la DPDK.
> 
> Ahh, that would make sense.
> 
> It would be nice to hear from those folks _somewhere_ about what their
> restrictions are and if they'd ever be able to enforce a subset of the
> ISA for MMIO or even (for example) make system calls to do MMIO.
> 
> Does it matter to them if all of a sudden the NIC or the NVMe device on
> the other side of VFIO is malicious?
