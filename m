Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786D133A9FC
	for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771965780; cv=none; b=oRCPd9TIOjMgdhK7T52s90VtY8a87aLOzJb/0doknzXPPRbURczt4BBhnjln6PNQh8VisUMf2D0jz50jElgVJplrZ4HdLSea99itXEw6oTtU/cTjtgUiTWdP9OrGCzc9GRtH4XLMqmzYIdMJTbOSuusYq7W8pdUqF0Gpbs+By78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771965780; c=relaxed/simple;
	bh=FFSIws9UZGCXCXlSxRzmXwLBnorm0MrWfAEBYQi/VmE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ojlzb7sI5UaOSRsmY3h6sb0qAH30T1aYgnfE4wyJWYUlTWi4ZLG2rpV8k/0S1IRdGpSV1ReObTIfDxPdaDoGLH2Lo3IYdrIoIk9CjAQJ31xkMzcnZyXvhMSEDbP0DigQ6IV54BdJCDuDISlvFz5wxnkUEZTid7hJ0Q8w0lq3PJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xii92ofh; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xii92ofh"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b62da7602a0so3912693a12.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 12:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771965779; x=1772570579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQvkurqnzRl0s4Cu5TERD53tESfJg6za9bkF8vg/CkM=;
        b=xii92ofhozRrgCa+46RsKx+VNw/amnH1KaoRsQeQkhfVQEhr/RJEdVT3S0XL3yGtBn
         OKAYZia317GMBXckvSIeSbPeFWmDhLTxv4Ema01hB7KxOxo1RU5CQQkBrLsh77IzZ1sL
         e72QbJVHsdRdFxF69XqMWJWMQi20ddrCyViEHLD6SNIG/hMqS/RKoen66DSyqIB02n5/
         qsnQeDCmgx8UC/K+bI7QBLo24JtvPnWTy595O+aSHEK0/lJVAyRq1qmxrr1wquadeaUS
         HtSaQIZJR9DRg+N+cr8nRoC+jEpueBpkAzlKiQd0jVSipm+zlmAlYjn5d98g6099732b
         yKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771965779; x=1772570579;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HQvkurqnzRl0s4Cu5TERD53tESfJg6za9bkF8vg/CkM=;
        b=n/K8SLpL1SULdyl4MlyTkIIO1GDGwdoOOVeVekmU0vbRlicSpLIz//zF2qabktUJjE
         cHmqyGvL+rtCyeyFhJMyDwj33l5YTE0EK15sKf26CnXhhAaeeCBNWvGkcohiwGDE9qO5
         V+K6WhMZ60taGrSVbMSQml+VT+gKmp+TWgH1mQTgghtiuXIfDjOhQngnay7pj+zxuuA9
         5nkIIAuPV2M3e7Chyc/xcDAxNFlb7Cx5d3p0A3WtrPOjocX7mzXmFSHz/mz+vQDYifzV
         0fLiOYrBvCXLqm6Ng4xaETO5JMUMgth8wkJoMPDAAM51+touDaEOXXA3oZl4Z2Au99YH
         LrZg==
X-Forwarded-Encrypted: i=1; AJvYcCWmXoNoj91TescjiDclQvg18yRUyKkAraxqYIppO2jd2Ka7G+U3iecyv7OOrx+qbGX8EyXXXVVz+FNL@lists.linux.dev
X-Gm-Message-State: AOJu0YxLmxk6ryPxiye5/TfqUYLDKWhcMW3Hda7czkMLk51x4VporK2n
	fPJzaRjXdHpkIjJBCdckXHBwgaYA4mesg4DOsVbYCoiDyIZLV3COyEnKJdtkbvx++O9vEtqcoD/
	Rtb1bGg==
X-Received: from pgeh26.prod.google.com ([2002:a05:6a02:53da:b0:c6e:1954:345])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3c89:b0:364:be7:6fe9
 with SMTP id adf61e73a8af0-3959f2f33b9mr96391637.32.1771965778642; Tue, 24
 Feb 2026 12:42:58 -0800 (PST)
Date: Tue, 24 Feb 2026 12:42:57 -0800
In-Reply-To: <d6820308325d5f8fee7918996ef98ab3f7b6ce6d.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260223214336.722463-1-changyuanl@google.com>
 <213d614fe73e183a230c8f4e0c8fa1cc3d45df39.camel@intel.com>
 <fd3b58fd-a450-471a-89a3-541c3f88c874@linux.intel.com> <aZ3LxD5XMepnU8jh@google.com>
 <d6820308325d5f8fee7918996ef98ab3f7b6ce6d.camel@intel.com>
Message-ID: <aZ4NUZdbH6PPUr5K@google.com>
Subject: Re: [PATCH] KVM: TDX: Set SIGNIFCANT_INDEX flag for supported CPUIDs
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"changyuanl@google.com" <changyuanl@google.com>, Binbin Wu <binbin.wu@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026, Rick P Edgecombe wrote:
> On Tue, 2026-02-24 at 08:03 -0800, Sean Christopherson wrote:
> > > But adding the consistency check here would cause compatibility issue=
.
> > > Generally, if a new CPUID indexed function is added for some new CPU =
and
> > > the TDX module reports it, KVM versions without the CPUID function in
> > > the list will trigger the warning.
> >=20
> > IMO, that's a good thing and working as intended.=C2=A0 WARNs aren't in=
herently
> > evil. While the goal is to be WARN-free, in this case triggering the WA=
RN if
> > the TDX Module is updated (or new silicon arrives) is desirable, becaus=
e it
> > alerts us to that new behavior, so that we can go update KVM.
> >=20
> > But we should "fix" 0x23 and 0x24 before landing this patch.
>=20
> Would we backport those changes then? I would usually think that if the T=
DX
> module updates in such a way that triggers a warning in the kernel then i=
t's a
> TDX module bug.

To stable@?  No, I don't think see any reason to do that.

> I'm still not clear on the impact of this one, but assuming it's not too
> serious, could we discuss the WIP CPUID bit TDX arch stuff in PUCK before=
 doing
> the change?

Sure, I don't see a rush on the patch.

> We were initially focusing on the problem of CPUID bits that affect host =
state,
> but then recently were discussing how many other categories of potential
> problems we should worry about at this point. So it would be good to unde=
rstand
> the impact here.
>=20
> If this warn is a trend towards doubling back on the initial decision to =
expose
> the CPUID interface to userspace,

Maybe I'm missing something, but I think you're reading into the WARN waaaa=
y too
much.  I suggested it purely as a paranoid guard against the TDX Module doi=
ng
something bizarre and/or the kernel fat-fingering a CPUID function.  I.e. t=
here's
no ulterior motive here, unless maybe Changyuan is planning world dominatio=
n or
something. :-D

> which I think is still doable and worth considering as an alternative, th=
en
> this also affects how we would want the TDX module changes to work.
