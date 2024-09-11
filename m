Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A9A1AD9C2
	for <linux-coco@lists.linux.dev>; Wed, 11 Sep 2024 16:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726071548; cv=none; b=EWXSSNn0FS90aMlavMyo/6wjVNz5RmrtWkLKuxw0/TP8DilLQE3+rfJHuogcVnmLjfVVFiHIhW1XKYIc/aylxmd99B+KSou3QnUB20k7d2812CUZGmeUyJxXih0W+cBKcdX+KUtrwcjKy6F1n6N3vcKvBBZxXErHFVX8I+IMhDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726071548; c=relaxed/simple;
	bh=j92VXawQX8WzgcuqvPeKn8SFNLPiwFWfUHFdzldq4Iw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pFRS+PFD0fpqwzG4RmrpEh/BQ7DEAsLJtNltCfLgwDrNn3mQn7/2Pzv1ib0Ks1zNu9VIb0U9fZ1lmC9qftej6XHsU7l/ndBFCAFg53iW/5pb1isuOuHKJZmlNaa/CZ1A/yHVe8IOsdNhVuQkVa/dc4qGWOG+y+iRkIUVtWP06Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fc0D6dEw; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fc0D6dEw"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7d4fc4652f6so78705a12.0
        for <linux-coco@lists.linux.dev>; Wed, 11 Sep 2024 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726071546; x=1726676346; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/QSsEQGGdeieAAmaVdQ5+5sF3iFYqq1ut09SVrphzA=;
        b=fc0D6dEwxb7u/BcRas8WRKMB+SHiJZ7MlZ6Yuc1uosTYEd68mgq/dM/7CjqkUB3YEx
         YDsLbtzRGAUrHfiOS+DB3iA2qmiMod/S3hFZo12z4QOimkAWQtaJLO0wOBkvYQ82Fl1F
         rOrlHgGorwjpPnKXL5BcyaAUNyu5z6JMRZHonv7tgaBdbWGA5sDlN62K8GzQY28AXrNQ
         E4boKLJHY3qwwpb6jtDNanb77E3/adRNPCSD46MSjuJqU/MRBgFTR/Uumxx+/jMOim0c
         TycX+/K9bSvoMp0fZB8nt44srMfULAd3NAa08CLnvFZ3uI3uLJ0gYJ7vV6BrS4f0MUfL
         NScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726071546; x=1726676346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/QSsEQGGdeieAAmaVdQ5+5sF3iFYqq1ut09SVrphzA=;
        b=lOkk88G6q1grwX1ihjj4S6oqN4g7Ag2BGFwPbsRd5QC21EI5yrAMIUsBYeuttk1TYC
         7L5FzlZcH3lZdUdEoO8kIepTZKXbkejxc8upEowxJsgMNJeRQ6hitLvXWNaM/XYeScWQ
         zEiZImy8AXd7lCpyFN6Op+0NdAPnkv0GanwFEp/ZVweL+OOE5gaBJVV1i1zYTIoG/ox/
         pnAz2DmuD+YM94hUR2QBuoMvOKkCW0gjehszOpLxBcLazvj+JQ0t5BR7G6PiFh1RdzTO
         vr3Z3IoSMwPsmW+7aqWo2xYfTLhrfNco4vSIxt+fE3+K0V61uNOq4AY6r9NJBF5uCDsJ
         VULQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqMudapv0eQAfP1c91hx6/w+82yFPaNW7zaDCTke9XCJtSmqIYyWYmv4dt8cdoH5oHBoJw97+t4xST@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy/+xq918s3hcu/neGemp0QgtXx5iN2LPoXvJIwEJ57YkRtsC7
	EhYfgoycKYGO2ViJtMMdcEgpxM50OLf2ie3S4lRCZyTi+r2nQ3Oq/C9ymt4+2L8H6tZy4O8JSAz
	csA==
X-Google-Smtp-Source: AGHT+IF1eyVHmrdR0suwJU7aJ9NfHqMoPPNxOdM9LJ9lqscolThGIJSPyFurGdsG0uQxxZ9hll9ugl5Y4Zc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:51e:b0:702:ab97:b7aa with SMTP id
 41be03b00d2f7-7db205edb42mr51a12.7.1726071546302; Wed, 11 Sep 2024 09:19:06
 -0700 (PDT)
Date: Wed, 11 Sep 2024 09:19:04 -0700
In-Reply-To: <d3895e03-bdfc-4f2a-a1c4-b2c95a098fb5@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1724837158.git.legion@kernel.org> <cover.1725622408.git.legion@kernel.org>
 <6c158a14-ba01-4146-9c6c-8e4c035dd055@intel.com> <ZttwkLP74TrQgVtL@google.com>
 <d3895e03-bdfc-4f2a-a1c4-b2c95a098fb5@intel.com>
Message-ID: <ZuHC-G575S4A-S_m@google.com>
Subject: Re: [PATCH v6 0/6] x86/tdx: Allow MMIO instructions from userspace
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Alexey Gladkov <legion@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Yuan Yao <yuan.yao@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Yuntao Wang <ytcoode@gmail.com>, Kai Huang <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>, 
	Oleg Nesterov <oleg@redhat.com>, cho@microsoft.com, decui@microsoft.com, 
	John.Starks@microsoft.com, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 11, 2024, Dave Hansen wrote:
> On 9/6/24 14:13, Sean Christopherson wrote:
> > Ditto for what behavior is supported/allowed.  The kernel could choose to disallow
> > userspace MMIO entirely, limit what instructions are supported, etc, in the name
> > of security, simplicity, or whatever.   Doing so would likely cause friction with
> > folks that want to run their workloads in an SNP/TDX VM, but that friction is very
> > much with the guest kernel, not with KVM.
> 
> I think by "guest kernel" you really mean "x86 maintainers".  Thanks for
> throwing us under the bus, Sean. ;)

Heh, I would argue that you tried to push me under the bus, but I'm slippery fast
and danced out of the way, and you got hit instead :-D

> I do agree with you, though.  In the process of taking the VMM out of
> the TCB, confidential computing has to fill the gap with _something_ and
> that something is usually arch-specific code in the guest kernel.
> 
> By dragging the KVM folks in here, I was less asking what KVM does per
> se and more asking for some advice from the experienced VMM folks.
> 
> > FWIW, emulating MMIO that isn't controlled by the kernel gets to be a bit of a
> > slippery slope, e.g. there are KVM patches on the list to support emulating AVX
> > instructions[*].  But, a major use case of any hypervisor is to lift-and-shift
> > workloads, and so KVM users, developers, and maintainers are quite motivated to
> > ensure that anything that works on bare metal also works on KVM.
> 
> Do you have a link for that AVX discussion?  I searched a bit but came
> up empty.

Gah, of course I forgot to paste the link.

https://lore.kernel.org/all/20240820230431.3850991-1-kbusch@meta.com

> The slippery slope is precisely what I'm worried about.  I suspect the
> AVX instructions are a combination of compilers that are increasingly
> happy to spit out AVX and users who just want to use whatever the
> compiler spits out on "pointers" in their apps that just happen to be
> pointed at MMIO.

Yep.  Based on the original report[*], it sounds like the userspace program is
doing a memcpy(), so it's hard to even argue that userspace is being silly.

[*] https://lore.kernel.org/kvm/20240304145932.4e685a38.alex.williamson@redhat.com

> But before we start digging in to avoid the slippery slope, we really do
> need to know more about the friction.  Who are we causing it for and how
> bad is it for them?

This type of issue will most likely show up in the form of an end customer moving
their workload into a TDX/SNP VM, and that workload crashing despite working just
fine when run in a regular VM.

One "answer" could be to tell users that they need to recompile with AVX+
explicitly disabled, but that's an answer that will make everyone unhappy.  E.g.
customers won't like recompiling, CSPs don't like unhappy customers, and CSPs and
hardware vendors don't want their CoCo solutions to be hard(er) to adopt.
