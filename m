Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAD93AB29E
	for <linux-coco@lists.linux.dev>; Wed,  8 Jul 2026 21:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783545377; cv=none; b=r9a+GLrQjz6AkY0BEIwBzx2g4PKpKj3pVr58HCPtzRE5UIJu0CkoDbb1C4X/WW6FgtVgl9OHMXmNtNkVJSGPUWXpl+vdV/61i8N43oXZytV7V9sOyWXgPNpcMqPQwgkPRt8AM0rycUMkIuGz7SjCLpdBIHXqChRXRtLCNBd4T0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783545377; c=relaxed/simple;
	bh=b9IXuZEhLEq8kcoaJ9iHTDPfKz7Q+etiiYjfpVDU2uI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zk+fktSnJedE8YqzUsIhEA1JHJz1qpaysXSco9pDUTUPZG2CiEHIu3uTVR8tVZfdzrwkOZmRmp7Ack9xXob7VYxpXQRNsSq69nUSBJagdLA9bEgfkEuxyofV5cAnCKuWKOg2YXFjE54dEpayxCAj4XsS8W7JIh8bMSzwOGCHwXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pgSRTyl6; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pgSRTyl6"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ccb687f82eso19721145ad.3
        for <linux-coco@lists.linux.dev>; Wed, 08 Jul 2026 14:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783545375; x=1784150175; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+YJvj0J4VBCeG53gEFWtVblMViyxqA7caDQne1cfRA=;
        b=pgSRTyl6FgJjodDg1FG1bLLSpP/ONNIa4Ni+u1SfkjCfZBelZvRviDgD3b+O9vZOfM
         LG5G7MYYK1gVZ+7CKgt9j+M4C5KWEuss43bzlB7WzAaP/Q/u+5xGI0HNB4MnegqaVq3N
         6ZR44fWWlq/9ys2a/gajrQGOe4Ml2iWlJfUShQrln0ZSlSknN7Rpqhb45Acej7tUWPmS
         ouTAcf9w2qnpFuw60M/Rw7YWnftA1USj/fMSyy5qy1rGKvU3QvQU3src9eDdO6oduT1/
         gRXrzrTGP3WvDEyoRY6dJEsWEpZnx9elrPBX2cYUr4cq9X+GveW4OFZ2Nz0JeFr7Ra+J
         QuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783545375; x=1784150175;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+YJvj0J4VBCeG53gEFWtVblMViyxqA7caDQne1cfRA=;
        b=isTmZBazrSaXXXc2mWljJavEjlFeZW8AMdlJqLj9IHTb3FtNLm/lQTkVI7GMORnWrl
         mDWA/dQq3jmyxQ2rtY3/VHHibeOxf3V+x0aAeme7ZX/EFcAaPTIvoGJ6md31mgaje9Dk
         w2kH6JYaUs1QksmfxJstpj7c8t8SVWfSUZBRJDIsDKUYBj6A4IbPNKfO9sUiNJ5+m0nk
         Fz9l+3zs1a9plqYXi9zNCdX7SNmCiHdln3GjM4sJiLhpA8oGljuXuunKEubtggPF6p8L
         82ZWr5CfZbQGIsVZmQWE3ygd+eyVcabbHe/4ePzgA5S0mYm2tk57eRTe5BZ47gsaHq59
         vZAg==
X-Forwarded-Encrypted: i=1; AHgh+Rojg9++ADxdh8jzcCotXkmbY4+b6p2fTMlQxpz8sk9bbGTxxmcysjXQ24YzMaDmQvhhNi2u+gVk5HWR@lists.linux.dev
X-Gm-Message-State: AOJu0YzVxhYiK/erEtia2ko7JnJSoSVy/Lx0SsP9+QGmpdI2Bsf4XDKb
	k1LYKCfeDIQ2h3zIkHStCrH1eTlw7pgwY6ZN40EY+ErPZym0tzYxH7+pv9seinYoyzVBZ00AI1I
	9H0QWiA==
X-Received: from plbld3.prod.google.com ([2002:a17:902:fac3:b0:2ca:f171:2082])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce87:b0:2ca:f8ef:33e4
 with SMTP id d9443c01a7336-2ccea30689amr37483195ad.17.1783545375091; Wed, 08
 Jul 2026 14:16:15 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:16:14 -0700
In-Reply-To: <08c9bf2f-75be-4244-b99c-153ec1f604ca@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <aj1tFuwZWdPGfUoG@google.com> <20260629100301.GA1743876@pedri>
 <akMQ3J6fK3DUBsPH@google.com> <23a9173f6e278ca7dfedce3374626c6ea3e1b47a.camel@intel.com>
 <6a445e4be6b12_3a3568100db@djbw-dev.notmuch> <akVNdxCzk-n4bgMv@google.com>
 <9df36c49e6be69dd9eece71f70a404a84b1563ab.camel@intel.com>
 <20260704054342.GB2169894@pedri> <akvsgVjwb00P1EuA@google.com> <08c9bf2f-75be-4244-b99c-153ec1f604ca@intel.com>
Message-ID: <ak6-HsAdwsXhywbZ@google.com>
Subject: Re: [PATCH v2 16/17] KVM: TDX: Add in-kernel Quote generation
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Peter Fang <peter.fang@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"djbw@kernel.org" <djbw@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, Yilun Xu <yilun.xu@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sohil Mehta <sohil.mehta@intel.com>, 
	Zhenzhong Duan <zhenzhong.duan@intel.com>, Kishen Maloor <kishen.maloor@intel.com>, 
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 08, 2026, Dave Hansen wrote:
> On 7/6/26 10:57, Sean Christopherson wrote:
> > What is "the S3M" though?  Is it a separate chip a la AMD's PSP/ASP?  Is it a
> > per-package thing? Per-core?
> I'll give you my rough software guy mental model of what it is: Each
> package has its own S3M. They are microcontrollers which are discrete
> from the CPU cores. Each S3M gets some CPU physical address space routed
> over to it.
> 
> > How is it accessed, and what are the "rules" for for those
> > accesses?  What types of latencies are we looking at?
> 
> As far as I know, the latency for one round trip to/from S3M is on the
> order of a "real" device. It has a physical address and when the OS
> wants to talk to it, those addresses are mapped with ioremap(). It's
> similar to any modern I/O device control plane. Note, though, that for
> TDX, there's no ioremap() because the I/O is hidden in the TDX module.
> 
> The real overhead comes because the I/O window is essentially 4 bytes
> wide (IIRC) and all the data that comes in and out of it has to be
> squeezed through that window. It reminds me of a UART, but with a
> slightly more arcane interface.
> 
> For TDX, though, the craziness is mostly hidden in the TDX module.
> 
> > What else uses the S3M?  Do we have to worry about contending with
> > non-TDX usage?
> There _are_ different users of S3M. But each of them should get their
> own I/O address and S3M firmware has to handle talking to those
> different users at the same time. The TDX I/O window is owned
> exclusively by the TDX module.
> 
> So, while S3M has and long and growing list of jobs, the random software
> (like the host kernel) poking at one I/O window doesn't have to know
> about the other piece of software (the TDX module) poking at another.
> 
> I'm sure I got a detail or two wrong in there, so folks that know this
> better: please correct me. But I think that's a halfway-decent 10,000ft
> view.

Thank you, very helpful!
