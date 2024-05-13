Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EE61CAAE
	for <linux-coco@lists.linux.dev>; Mon, 13 May 2024 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715620202; cv=none; b=dif9hhzCKZ2NdAk27vF6yTm7T5ZcjxHmzbaPJ4ZkYkzmoAlQtQOkQzeoUFwo58T/ayHFNUKOSYb/1cW7IVMS8YRbhNLq1zcpbaIHvo1wDN78gba24ep6hy6THIQy2odnRH9yIrAsy20pqiu0ouxYkgiAHvPiCwAy2kMyTqqntT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715620202; c=relaxed/simple;
	bh=vntz1T6lSeN+0vUm9L7SvFCiGb+zPgUS4AJcZyT09Eg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MMWd8JnbXGRlijzaHDSqyNKY6viT1Kr+Hh44aPlCEy7DOMeDRHIH7Qvn/msEQBKwiIpE8QE8aYHNKcleSBxt8U07bssP//jb/Yh1DzFRsWLihjyNX0tKM31jbw8VhR0tdpv4agkUZDFnvWj8z+SjVdyQ2sw5jz81J+OyAKNlnqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lnbBSHIF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lnbBSHIF"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1ee2f06e652so49591455ad.1
        for <linux-coco@lists.linux.dev>; Mon, 13 May 2024 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715620201; x=1716225001; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqAMYyJARP70lQweb95UizBZYpowafIc/1BTiL7HAHE=;
        b=lnbBSHIFCFAyhWTsQBhX1wdw6eUTJk9WJ4S0dM/Rttci0pN4ijqZ7JSE5l1nKvJ3ER
         tho5BGXbOIgPQ5f5n/TO0666ow0+Ei+XoKopRx0/jWge1Y15odfc4q4khIjrDt1kX+7z
         WaZ1s1Ver9OLQ9SZUio8VkapjeLNRERb2QwJcYtx02isvhy48+Ggpa25OSIjNvS+4SiU
         /qTibUeSPG3apSZ9kUvGWH02gJVVVdfXEIisS2fVw0L01HwUcqpbcRyypAWScd6KFCqE
         FZmiQYeonEhJMLixdpk0u2Kxq2C90iHy9cvpJd/7eTpxMJZIA4j+DBOl+AREzVOGd4gb
         4VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715620201; x=1716225001;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eqAMYyJARP70lQweb95UizBZYpowafIc/1BTiL7HAHE=;
        b=kJgImhEehXU6UGTIhdwWk7VqUgU6lwbyhEdnXzkx92bd6hhSlEqe3p0Ze0ag4IZblM
         UrPNEjbFCfXTcVkEx8zW/6iGtiJIySyihNVzFcHKq/AuGv1SHkmHhOaVz11xUWbJ/HCf
         1QOOEIIIycG1heENpc5TtOk1teKySGcGaHcfDvnBrwo7IH3CqYLo51/Oycsi+o8354h4
         8ipzfWRFrk4Ec2isvpqX2Ma5z9/WGOvpPH2lqFjY53+8BgOelhgt1/pbtl1ltzSs/Dfm
         xFJQhiai2RjuvxLwSwmoqSxBrGYHc4rw5AbqsThzKxyR5Jyj1i0YG0Uo/QlitPBaf0Dj
         hmRA==
X-Forwarded-Encrypted: i=1; AJvYcCX5uA+Pnjv6xoE3ZwRk5wJzI11y+ZIaLqEReBa+lXbdqOPlcqB9A8Nc3LZJefaUTMqvAQe0Md0EFzmYCWjFoI607BKNOn+oJSQhUQ==
X-Gm-Message-State: AOJu0YyHb2KwrYoRZF81C1IWAsraRel2Gy8VXpPBxOJjnaVD41/f/n0f
	YVGXNc5w6/YlxEcF/MSVF26hNXkYjLF9yvWX4giWbaFurlpZuU6BULfBFQ/9V4Jf/JT3Us3It4K
	OFw==
X-Google-Smtp-Source: AGHT+IFe9bUcF2cKcIAR1X9HznQBXdRthmRbSGERQIgzvsrvwXGdt51Pjnpg13XPQnNPLlENosr3rjbDm/4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e752:b0:1e5:62:7aa6 with SMTP id
 d9443c01a7336-1ef43c0fe5emr540015ad.2.1715620200915; Mon, 13 May 2024
 10:10:00 -0700 (PDT)
Date: Mon, 13 May 2024 10:09:59 -0700
In-Reply-To: <aaf684b5eb3a3fe9cfbb6205c16f0973c6f8bb07.camel@amazon.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cc1bb8e9bc3e1ab637700a4d3defeec95b55060a.camel@amazon.com>
 <ZeudRmZz7M6fWPVM@google.com> <ZexEkGkNe_7UY7w6@kernel.org>
 <58f39f23-0314-4e34-a8c7-30c3a1ae4777@amazon.co.uk> <ZkI0SCMARCB9bAfc@google.com>
 <aaf684b5eb3a3fe9cfbb6205c16f0973c6f8bb07.camel@amazon.com>
Message-ID: <ZkJFIpEHIQvfuzx1@google.com>
Subject: Re: Unmapping KVM Guest Memory from Host Kernel
From: Sean Christopherson <seanjc@google.com>
To: James Gowans <jgowans@amazon.com>
Cc: Patrick Roy <roypat@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Nikita Kalyazin <kalyazin@amazon.co.uk>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"somlo@cmu.edu" <somlo@cmu.edu>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	Alexander Graf <graf@amazon.de>, Derek Manwaring <derekmn@amazon.com>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "lstoakes@gmail.com" <lstoakes@gmail.com>, 
	"mst@redhat.com" <mst@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024, James Gowans wrote:
> On Mon, 2024-05-13 at 08:39 -0700, Sean Christopherson wrote:
> > > Sean, you mentioned that you envision guest_memfd also supporting non=
-CoCo VMs.
> > > Do you have some thoughts about how to make the above cases work in t=
he
> > > guest_memfd context?
> >=20
> > Yes.=C2=A0 The hand-wavy plan is to allow selectively mmap()ing guest_m=
emfd().=C2=A0 There
> > is a long thread[*] discussing how exactly we want to do that.=C2=A0 Th=
e TL;DR is that
> > the basic functionality is also straightforward; the bulk of the discus=
sion is
> > around gup(), reclaim, page migration, etc.
>=20
> I still need to read this long thread, but just a thought on the word
> "restricted" here: for MMIO the instruction can be anywhere and
> similarly the load/store MMIO data can be anywhere. Does this mean that
> for running unmodified non-CoCo VMs with guest_memfd backend that we'll
> always need to have the whole of guest memory mmapped?

Not necessarily, e.g. KVM could re-establish the direct map or mremap() on-=
demand.
There are variation on that, e.g. if ASI[*] were to ever make it's way upst=
ream,
which is a huge if, then we could have guest_memfd mapped into a KVM-only C=
R3.

> I guess the idea is that this use case will still be subject to the
> normal restriction rules, but for a non-CoCo non-pKVM VM there will be=20
> no restriction in practice, and userspace will need to mmap everything
> always?
>=20
> It really seems yucky to need to have all of guest RAM mmapped all the
> time just for MMIO to work... But I suppose there is no way around that
> for Intel x86.

It's not just MMIO.  Nested virtualization, and more specifically shadowing=
 nested
TDP, is also problematic (probably more so than MMIO).  And there are more =
cases,
i.e. we'll need a generic solution for this.  As above, there are a variety=
 of
options, it's largely just a matter of doing the work.  I'm not saying it's=
 a
trivial amount of work/effort, but it's far from an unsolvable problem.
