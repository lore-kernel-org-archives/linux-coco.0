Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E41549F
	for <linux-coco@lists.linux.dev>; Mon, 26 Jun 2023 21:48:16 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-c0f35579901so3925674276.0
        for <linux-coco@lists.linux.dev>; Mon, 26 Jun 2023 14:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687816096; x=1690408096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wZVFLEwCNz6O5VSX0dKeV/2hfaxawROSg/UwuvPb7KA=;
        b=QbFhbyGMP77zQoxyBWcuFmcKZufP0/xanTgxOrKGk772Ft+Peae3q0m3lPZ3JTsLXB
         LRM6NDzCEIhuyuzhKe0bcBhs0B5kRUuvw6iZEjIj2cGCFyVSKbNY3OHbUvrG6J6kmvAM
         50OWIRgkM4yZE3M3MeNj12jwl+sVhH1ig7zTI17o91Z12gvOlfQk/VBXUo7o0JPpiXff
         /ETda+Ecl1FtH4LQrAWH53lLlfkcziNzQde8VuSGd4qbjS9RfiOY7jIjrMWJWrzkCQ+U
         Zu/PDjh2O+B7SGx31VeCXNREQ+pjgGgIkVCVSCbFiAG9B7VBaBrF24XhKXjmk8t3ZS1U
         tT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687816096; x=1690408096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZVFLEwCNz6O5VSX0dKeV/2hfaxawROSg/UwuvPb7KA=;
        b=WSPTFe0rmYUS4bhGgEOsACkc1EbksHIQgQVGTwE+207glvTaMz6ZZMZr0WQpP47V35
         7NmhT7E2mujBMoYy6mlrcRX+76+h7rWge6/GR2Ir5O3EXNNT/3GHtS1P783OPdFTJYfJ
         MsIe67iA89lPZMoNwWXA5rAC89xRg1uF7lEQK4tk1SCYIgf+7/a/DPqaQTgfGWOiSWpL
         kCp/BTcVxRqsoXjT88NZN/LI1ufwlhK4dH0+j6G05GvJkLG0ltgEO10EnNwXmx+vXQSe
         lF7nP4rvYpc5ZKCyY3QnaK5+MNtBEMmYIMYT1SwwwQkYWMpyBuoGO47vvK3ulKn/2CJf
         9WLA==
X-Gm-Message-State: AC+VfDxEdJd1riyfV4S4yNVP7rG1JFt1VreP1tLS0vTLWG82B3v4fVsP
	rGnd2GMzB8eSMTcZuU5v1gj/tZ6ofqo=
X-Google-Smtp-Source: ACHHUZ6QHacu0vmaWyfYkBFmM6ESWSZg2AruFnD5EFFU2sXqMHPOlYKXjh4rAsPaHNGFPgotAGgeI+0SkiU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d387:0:b0:bd6:9fb7:69bb with SMTP id
 e129-20020a25d387000000b00bd69fb769bbmr13450357ybf.13.1687816095794; Mon, 26
 Jun 2023 14:48:15 -0700 (PDT)
Date: Mon, 26 Jun 2023 14:48:14 -0700
In-Reply-To: <93404a98324f1a4e93a6b6e711b209bc57c831de.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1687474039.git.isaku.yamahata@intel.com>
 <b659f86ac7128965e05a7a660c38734667530fc0.1687474039.git.isaku.yamahata@intel.com>
 <37b868c53c9f35e8ec051573562a4598df38d72d.camel@intel.com>
 <20230623025429.GB3436214@ls.amr.corp.intel.com> <ZJXS7tU6iukBXSuv@google.com>
 <93404a98324f1a4e93a6b6e711b209bc57c831de.camel@intel.com>
Message-ID: <ZJoHNPn/tppcJDLG@google.com>
Subject: Re: [RFC PATCH v2 3/6] KVM: x86/mmu: Pass round full 64-bit error
 code for the KVM page fault
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, "dmatlack@google.com" <dmatlack@google.com>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, Bo2 Chen <chen.bo@intel.com>, 
	Sagi Shahar <sagis@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Erdem Aktas <erdemaktas@google.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"zhi.wang.linux@gmail.com" <zhi.wang.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"

On Sat, Jun 24, 2023, Kai Huang wrote:
> 
> > From: Sean Christopherson <seanjc@google.com>
> > Date: Fri, 23 Jun 2023 09:46:38 -0700
> > Subject: [PATCH] KVM: x86/mmu: Guard against collision with KVM-defined
> >  PFERR_IMPLICIT_ACCESS
> > 
> > Add an assertion in kvm_mmu_page_fault() to ensure the error code provided
> > by hardware doesn't conflict with KVM's software-defined IMPLICIT_ACCESS
> > flag.  In the unlikely scenario that future hardware starts using bit 48
> > for a hardware-defined flag, preserving the bit could result in KVM
> > incorrectly interpreting the unknown flag as KVM's IMPLICIT_ACCESS flag.
> > 
> > WARN so that any such conflict can be surfaced to KVM developers and
> > resolved, but otherwise ignore the bit as KVM can't possibly rely on a
> > flag it knows nothing about.
> 
> I think the fundamental problem is we mix synthetic bit(s) with the hardware
> error code together into a single 'u64'.  Given there's no guarantee from
> hardware vendors (Intel/AMD) that some bits will be always reserved for software
> use, there's no guarantee the synthetic bit(s) won't conflict with those
> hardware defined bits.
> 
> Perhaps a fundamental fix is to use a new 'u64' as parameter for software-
> defined error code passing to all relevant code paths.

Yeah, in an ideal world KVM wouldn't usurp error code bits.  But I don't know
that it's worth plumbing in an extra param to all the affected helpers.  From a
functional perspective, unless someone runs with panic_on_warn=1 in production,
or I'm missing something, the warn-and-clear approach is sufficient.  If we get
more synthetic "access" bits, then we should revisit this, but I think for now
it's ok

> But I think your fix (or detection) below should be good enough perhaps for a
> long time, and even in the future when such conflict merges, we can move the
> synthetic bit to another bit.  The only problem is probably we will need
> relevant patch(es) back-ported to stable kernels.
