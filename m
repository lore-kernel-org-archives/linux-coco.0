Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A58A299AB3
	for <linux-coco@lists.linux.dev>; Wed, 29 Oct 2025 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761745719; cv=none; b=rIYOrPoUDa1H/6LpV8kXbLV4DnnB2A+R1Bw3Vg/yTjNhnNyeFCQDZTI+yYN4caW+vZiQtGNQUsCZjFi+20WO5VPxpBMdTA54e/gq7qzhm1BJ7fMotDtUM9/RXTcK7qgAXnqxl/5x+dOoxIFzbwNyEbz98eqQOoAqJ5AJN8ompIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761745719; c=relaxed/simple;
	bh=9PVB5zBv2zFukgLFPs6dQjhYsTqNgJk+vg6V5Vp4m2c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=isTLMWlY9CV+TL+eswVW1N5xdeqkj0fK8qnknxV9N4y1l7tqbOJ4W6akCt0QswZ6ItAjT91ySzOUYYlU329IF3fN5ruxw8imrjd3Z1C8kpiKWhra6iI/JCMavHhreb4fsV6/Fq9xKPGXukiLkoS4Y7jKPpc2zt7pRT+A5sr2ijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NSzeywnp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NSzeywnp"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so11643717a91.1
        for <linux-coco@lists.linux.dev>; Wed, 29 Oct 2025 06:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761745717; x=1762350517; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xdHccMmYepT/ISL0jGN7yG+GkzRFqfu9waW3qgcJU44=;
        b=NSzeywnp8U3ZVjubiq9Adg3q0Mzbkj5PpbaBVYlBJsVMCaw28ebBO9d9FOCtpuhKS2
         Oo/vTskd5aWaPykP/eNlKZ7qo1ScTY6P1JC1wM7DFCvFQlu59iXsU5b7HiwrTfIql+8n
         Fn+S3nXt91dXmYVcjxFAx1g3AWYzafdW1Z9JsKKuA8VB5MgMW8r1MksFDYdHaVHJuEJ3
         kb/wBc5+dhv7hEcHEH4IaLULNk9n0fWmvAqlYsR0nggzBTIbdWvVgWYAkBHFzUUh+UcW
         Je6lGLlQ/V7ZmXwgLIgriETUYE5Znv+nKlDW4d92V7laUBXPGFf5aUDn17DeiN59XU02
         wP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745717; x=1762350517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdHccMmYepT/ISL0jGN7yG+GkzRFqfu9waW3qgcJU44=;
        b=d6ngexFtCJTiaJn3IjBMNjEDpIGHc0PBOQK9fGgfsZGm/hbyinAVNVaWJIHWzPdOeV
         h4S4MUwxgSNQ1dH54Nh3HMbL3jrNmEmAXLJITANtzB/1S7pcylNF44C11hwO894RilRY
         a+UA1y0/wlpvasLhRzSeLZcSO7duyeujhToIqJgY3fplLTzXoJLJ1jvgHn2ZGtY84GNT
         4sLT8iqlAjOJ+RA1JJQlV5zK/tHCeyamYgsyz/yArc0+J80LNYvj8AH5ByNlxlCRSR2E
         nRarx1ivT5ilD7qM8wmEhVf0bbD1Y7X4vHX3WmCz3k03/2f2wVg/KphPFx+9VZ0rHe7F
         QLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXACU7jgm3cKDFzCrBgFqJfYdefZANmOyxB92wvtUoH3VN9+K3luWzISRAxLMyejcnclnN05vHxCdjf@lists.linux.dev
X-Gm-Message-State: AOJu0YyOEjtHJV0Byp0df7xuWy20034HGw/0blhPP0oA0evN9uGaJ1sr
	wy73MUDxMD92/Q0GSeskSKUrDaOHYnNzrHtTXMx8TD1saFZaQjcRBAmo9CJhZcLlaNY7TQDH4an
	nnKWicA==
X-Google-Smtp-Source: AGHT+IG197XQ5HcKAVF2KhAkc6YfgtWRX32xq7sEgnaKNI+rXoWYFC+1cgH/mDXdCdhip0xmxN5QjKReWFM=
X-Received: from pjbsv7.prod.google.com ([2002:a17:90b:5387:b0:340:3e18:b5c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:498c:b0:32e:32e4:9789
 with SMTP id 98e67ed59e1d1-3403a143401mr3210393a91.3.1761745717502; Wed, 29
 Oct 2025 06:48:37 -0700 (PDT)
Date: Wed, 29 Oct 2025 06:48:35 -0700
In-Reply-To: <6901792e39d13_10e9100ed@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <68fc2af6305be_10e210029@dwillia2-mobl4.notmuch>
 <CAGtprH8-UGFkh4NmuY1ETPYmg7Uk+bm24Er2PPxf8tUOSR_byQ@mail.gmail.com>
 <68fe92d8eef5f_10e210057@dwillia2-mobl4.notmuch> <CAGtprH8g5212M26HPneyaHPq8VKS=x4TU4Q4vbDZqt_gYLO=TA@mail.gmail.com>
 <68ffbfb53f8b5_10e210078@dwillia2-mobl4.notmuch> <CAGtprH-rv9T1ano+ti=3eU4FO2APCOcR06buPALggAwUnka3Dg@mail.gmail.com>
 <690026ac52509_10e2100cd@dwillia2-mobl4.notmuch> <CAAYXXYyVC0Sm+1PBw=xoYNDV7aa54c_6KTGjMdwVaBAJOd8Hpw@mail.gmail.com>
 <aQFmOZCdw64z14cJ@google.com> <6901792e39d13_10e9100ed@dwillia2-mobl4.notmuch>
Message-ID: <aQIbM5m09G0FYTzE@google.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
From: Sean Christopherson <seanjc@google.com>
To: dan.j.williams@intel.com
Cc: Erdem Aktas <erdemaktas@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Dave Hansen <dave.hansen@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	Reinette Chatre <reinette.chatre@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"sagis@google.com" <sagis@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 28, 2025, dan.j.williams@intel.com wrote:
> Sean Christopherson wrote:
> [..]
> > > IMO, It is something userspace should decide, kernel's job is to
> > > provide the necessary interface about it.
> > 
> > I disagree, I don't think userspace should even get the option.  IMO, not setting
> > AVOID_COMPAT_SENSITIVE is all kinds of crazy.
> 
> Do see Table 4.4: "Comparison of Update Incompatibility Detection and/or
> Avoidance Methods" from the latest base architecture specification [1].
> It lists out the pros and cons of not setting AVOID_COMPAT_SENSITIVE.
> This thread has only argued the merits of "None" and "Avoid updates
> during update- sensitive times". It has not discussed "Detect
> incompatibility after update", but let us not do that.

But we already are discussing that, because the "None" option is just punting
"Detect incompatibility after update" to something other than the VMM.  Doing
literally nothing isn't an option.  The fact that it's even listed in the table,
not to mention has "Simplest." listed as a pro, makes me question whether or not
the authors actually understand how software built around the TDX-Module is used
in practice.

If an update causes a TD build to fail, or to generate the wrong measurement, or
whatever "Failures due to incompatibilities" means, *something* eventually needs
to take action.  Doing nothing is certainly the simplest option for the hypervisor
and VMM, but when looking at the entire stack/ecosystem, it's the most complex
option as it bleeds the damage into multiple, potentially-unknown components of
the stack.  Either that, or I'm grossly misunderstanding what "Failures" means.

That section also states:

  Future TDX Module versions may have different or additional update-sensitive cases.

Which means that from an ABI perspective, "Avoid updates during update-sensitive
times" is the _ONLY_ viable option.  My read of that is that future TDX-Modules
can effectively change the failure modes for a existing KVM ioctls.  That is an
ABI change and will break userspace, e.g. if userspace is sane and expects certain
operations to succeed.
