Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDC757CBB
	for <linux-coco@lists.linux.dev>; Fri, 13 Sep 2024 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726244887; cv=none; b=rJ0bTjFmwYJowpvm9tfr4+Ff3a2VmHWGiBJyBtGo4lcBZVROuCRPRR2OQ8tA3QCPKoM0Adt+bWg4I+yoqPPR+WuGDnT23x1z8Us79+EwhhGXo+S8zNUO2IT5YRYKcRdUcujgfokpl7nO+rnPpHMoj5tlSbNggGmhSYBjF6WecyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726244887; c=relaxed/simple;
	bh=Dz4ycnfvKoef37mAeFE+o6mhEPp3GIZ2MGXjJvSfPUs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J+7fdQd1ycf3MjJBbZFdRkRzHNN0H8bg8jSOVo5PMVlkH9hpqHwi8/FyVfR1eezDVc/DEEQrdZWgo59oLz7i+YsFYbsMcpUxSzUCMI4Hx/XVh3Gz0g4rqF1Rbd3KECnNJW/6qHyan06Z4sTzGDpL8TzcewglrC8poLw7ojRkxys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VK4EzB5e; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VK4EzB5e"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7179469744dso3281617b3a.2
        for <linux-coco@lists.linux.dev>; Fri, 13 Sep 2024 09:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726244885; x=1726849685; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cN9LbXKrRTawqhLxdUzFmP/6lGNimEaJ6R6JDJd4qJ0=;
        b=VK4EzB5eHi22dh3VXrjSWJgHsQZWW+q5c3sEM1j7oj7OvDhlLQ0aALAEYfM8ExZpZp
         SO94EJH3Ozx+RXAqBz+BszxEAyxsKmtBb9Pl4lKwYcathpTOJJZcQJYyUcyEnPSPmOMZ
         lgiebWWI7RUyK5GyGX3lI8R/pfVD5BvyOG2ApOGak8GRgMt/konp+WMrIvWG5pIfK19l
         kHA68upr6/p9BagZNnXVu0PMAydLEQWqPXghgL7ERMgy+F57KKmxhvW82ceEiJV5rA5R
         IPxpjpgXd/NF5QHQNb5WFdhWCDBa/9gIn6Z/azJnWZhHL53k8p2vLaLSQk8E4iuwhbJv
         Oa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726244885; x=1726849685;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cN9LbXKrRTawqhLxdUzFmP/6lGNimEaJ6R6JDJd4qJ0=;
        b=U2ivoYmLw78Ji3yyepAEVYKA9QRunO3mlwYjAPMs4hJrwL9x1HuI1e4e3hKgSOviWg
         A8CIk913dDJmELzupFKDyXaLAoWufTJ51erRS4ozqSRzSi7UnLCzY6crLKe+LokvKNU7
         RailRPf0zrPRX42oPLdlX6HXG0cJCqhqPEeimlRPpjUYdaEmzvIZoSOloOABSK9Gw55s
         e+vwHvugG/hXk72nqrsDkv2urvoMx6VjTQjVlj4V82H9vu58BaW9h3tbB/RXpzfSE3br
         BryWKn6Jb5R9hwHoH9GUfFh29U2hpoFx+P8cWsTWmm31pMuP8wKYWst3ANrmS64v0xMx
         H81A==
X-Forwarded-Encrypted: i=1; AJvYcCUzbPVdIC9GkkMueJkfC1IAA/LGO7z+CZWSy+3MEvVW8hAsvyqfespP4ylun6gfvHUGyKK9TMINDLKb@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2875czrfIAsky0McH3pHpdnpnPOq3MHssORDoEoYeotRrus0A
	ocdNYDfaT2uE8ONfcPpG5VLyF1ZqN3Feq1Oq4/vDtWz6r+tiaKaStFcFA7ucZdkot8EslDFAbQN
	zjw==
X-Google-Smtp-Source: AGHT+IEyFXub8qnBjI0i5iQfgEPlsRdkIO3FIrijTVZf40RVSEUHkYTCWRuRVG3w2Em0cQHn4IDy8Vj2t8o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:91d0:b0:717:92f2:d50b with SMTP id
 d2e1a72fcca58-71925fa5ba1mr22049b3a.0.1726244885020; Fri, 13 Sep 2024
 09:28:05 -0700 (PDT)
Date: Fri, 13 Sep 2024 09:28:03 -0700
In-Reply-To: <c0d9ff5f-85d5-4df0-94a8-82e3bf6fe21f@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1724837158.git.legion@kernel.org> <cover.1725622408.git.legion@kernel.org>
 <6c158a14-ba01-4146-9c6c-8e4c035dd055@intel.com> <ZttwkLP74TrQgVtL@google.com>
 <d3895e03-bdfc-4f2a-a1c4-b2c95a098fb5@intel.com> <ZuHC-G575S4A-S_m@google.com>
 <h5gp6dgcfazm2yk3lorwqms24c2y2z4saqyed6bnzkk2zhq5g2@rf3lj2a22omd>
 <039bc47c-9b5d-41f3-87da-4500731ad347@intel.com> <2v2egjmdpb2fzjriqc2ylvqns3heo5bpirtqm7cn32h3zsuwry@y5ejrbyniwxq>
 <c0d9ff5f-85d5-4df0-94a8-82e3bf6fe21f@intel.com>
Message-ID: <ZuRoE6P3DxxK_3C9@google.com>
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
> On 9/13/24 08:53, Kirill A. Shutemov wrote:
> >> Basically:
> >>
> >> 	New ABI =~ Specific Kernel-mandated Instructions
> > If we are going to say "no" to userspace MMIO emulation for TDX, the same
> > has to be done for SEV. Or we can bring TDX to SEV level and draw the line
> > there.
> > 
> > SEV and TDX run similar workloads and functional difference in this area
> > is hard to justify.
> 
> Maybe.  We definitely don't want to put any new restrictions on SEV

Note, SEV-MEM, a.k.a. the original SEV, isn't in scope because instruction decoding
is still handled by the hypervisor.  SEV-ES is where the guest kernel first gets
involved.

> because folks would update their kernel and old userspace would break.
> 
> Or maybe we start enforcing things at >=SEV-SNP and TDX and just say
> that security model has changed too much to allow the old userspace.

Heh, that's an outright lie though.  Nothing relevant has changed between SEV-ES
and SEV-SNP that makes old userspace any less secure, or makes it harder for the
kernel to support decoding instructions on SNP vs. ES.

I also don't know that this is for old userspace.  AFAIK, the most common case
for userspace triggering emulated MMIO is when a device is passed to userspace
via VFIO/IOMMUFD, e.g. a la DPDK.
