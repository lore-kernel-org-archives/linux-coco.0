Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F82C1B422A
	for <linux-coco@lists.linux.dev>; Wed, 19 Mar 2025 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395322; cv=none; b=RPccb3QzshT13TAroCmTrJET5G/M6xrHofrx4/mFoBsFAJJ+M9jgXu2x9zvBxwWc2uMEBFlzxVjTK6wYquH+JSLTn+GwsHiOzLJ486wv21NQyp8xascGR64DL7Id8hlJe5oLAz4IytvZhSb/SlTQ3q9I4xymMaNd5mC2vziTg78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395322; c=relaxed/simple;
	bh=MmoHqATUSqHXeVH3YSgYzPetG3EKkerQHh+jFa/NOGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLMa55TXY5kUA+CL5yXQzG458/X3yQZ8vikPClpgDZf6Sh2jxSMa93T7exM1wzBdGVFk3a/0PzvJ8KtzHB1vxB+8DUwVx31JnlvsJgMjp4SnBg98SiwaaJxmVZwovqVVKCOjDAic3p43wlIVROYlDpGb1Ck1v11FvBQnIxBqJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g03A30TP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g03A30TP"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2963dc379so1182729266b.2
        for <linux-coco@lists.linux.dev>; Wed, 19 Mar 2025 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742395318; x=1743000118; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaQNutkZucM9cAY/mSyqo0F6Ni31F3XIqzfePCps/HE=;
        b=g03A30TP5DUD4W+UpeKqzVyM6KyT8CjjbZ4f7ixefCuKbSz8Fc/cz+quO/hp+u8/kX
         Eb+fssNNE2y+ZZdmlHJ9pzTv1m+lCq94kcq5CyN9baTQpqlVUSOdIzRle0sxluQ4dABt
         Kg4kaPHW0isp+dsuXFFxs+XZ+q8+xf1DkuSGuxKc5F+mSI6brY042w/7pUzeAR47Ca5O
         3uEyYhYVhiSc7CnVC8WoWUD9vhvkDBup32vW6c24OvzUFqRyaMYQOe0BkajoRQMFuVXk
         H9Rht4W0KON0ewE4ByWHkoxBNTqFtnUKFvg/Mt+751yyCzmdYlWSa3Yn2BBnmCpMTqDV
         q9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395318; x=1743000118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaQNutkZucM9cAY/mSyqo0F6Ni31F3XIqzfePCps/HE=;
        b=dBI/0VJwEt09SsEe39CO6RYfr3MVY3WYrM+cf/GXTtB9rk3xlQkyYM4vLg9Z4rBR/9
         4mgWrmPyUTbueEZoFVA1/3UAhfA6uoWW3UXmb5diYFihutCILaBPXYXUylNm/1W20OdQ
         mq02dxJQDZqPCWkzVZbiUvl6FRRIp75s5qK1Z6JFpA3/CI/jTj7ss1Sf2rtVp9Ex15gO
         PccBQ+EfDOJs97689+SkItrDJA9IsrXuXgtb2ypGqg22/FaZfJ3M9DX1b/VrJIWd5fre
         7aqO5ssisZukwfC4ox9SUMu+DfsVFK9l7L/6r8HX//wD9X7ARgiX81v/WyJOWb9IhVFh
         I9Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXQbdPRgq9DuKXBf2RCnkvY5XpeUqxdT93nCF3vDL1uyPXwVz9yy8mBKTcG7hX4KbUKGrznDbicG2qa@lists.linux.dev
X-Gm-Message-State: AOJu0YzDQm15c7rfb6XnH3fErTjtLN8E8VPYSLn9PX36edXZBc/0dLVq
	Xbk3P9MrOVo9XZTcae6e+/wpQ/bsTljQoZFF+1lCNz5XdQfJb8Uv36V61st0I+sJRmNkprSawCO
	jUV203PvWk+o1Uku4UGo8yh1qvryA/RB//p6L
X-Gm-Gg: ASbGncvIQda34WRJeffkygYzEXIv2KLs5LpPJs2S33bcYuTxjW5TfPp0hnkYc03TM/d
	NPPG74oFvzNi6isstNtDJaw+1xfy9sEhpyXv3DPJEnqrnuTvfGQuoHK/PkhuM2Y7uPZ2VKobRa3
	/bI9Itcmh1UFQIPAUb17dkfxrc
X-Google-Smtp-Source: AGHT+IFZJiEk1bn80M9+T4N31tNh/LxSgahjpDI6wv7sHZfCBfmgDrAjE52mEImUYTvnFxvq2jWvRaVILUfUFxW2/H4=
X-Received: by 2002:a17:907:ec0e:b0:ac3:422b:a834 with SMTP id
 a640c23a62f3a-ac3b7c070a3mr312786566b.21.1742395318300; Wed, 19 Mar 2025
 07:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250223-tdx-rtmr-v2-0-f2d85b0a5f94@intel.com>
 <20250223-tdx-rtmr-v2-1-f2d85b0a5f94@intel.com> <8e3736c1a0b650179dab177feafdef1a596f81c7.camel@intel.com>
 <aa492474-e975-4121-8e0f-54414a7f5e65@intel.com> <f031cf8e34ef82649e32c8060ef4a42a2e185783.camel@intel.com>
 <95a490b3-49ad-4bb1-8894-9fedd18b8ab5@intel.com> <b2d10ed8780689a8c2a6168c8f4e4e9ba9baea89.camel@intel.com>
In-Reply-To: <b2d10ed8780689a8c2a6168c8f4e4e9ba9baea89.camel@intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 19 Mar 2025 07:41:47 -0700
X-Gm-Features: AQ5f1Jq7cVehuTGEaskc_1Eg551myj8jQoV_OvUYnm-JkU5_N6pGXCqjDxOZ7QM
Message-ID: <CAAH4kHbYuc9J1PuyLvgEJT6RhKarbVEV7vSB=raHckzUBRMGGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] tsm: Add TVM Measurement Register support
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"x86@kernel.org" <x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"Williams, Dan J" <dan.j.williams@intel.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "Xing, Cedric" <cedric.xing@intel.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "hpa@zytor.com" <hpa@zytor.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"dan.middleton@linux.intel.com" <dan.middleton@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"mikko.ylinen@linux.intel.com" <mikko.ylinen@linux.intel.com>, 
	"James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 4:29=E2=80=AFAM Huang, Kai <kai.huang@intel.com> wr=
ote:
>
> On Mon, 2025-03-17 at 17:49 -0500, Xing, Cedric wrote:
> > On 3/12/2025 6:11 PM, Huang, Kai wrote:
> > [...]
> > > > The key difference between MRs and reports/quotes is the lack of
> > > > context. Reports/quotes benefit from having a separate context for =
each
> > > > container, ensuring they don't interfere with each other. However, =
MRs
> > > > are global, and creating separate contexts would be confusing since
> > > > changes/extensions to MRs by one container will always be visible t=
o others.
> > >
> > > This makes sense.  Could you put those into the changelog?
> > >
> > MRs have been under sysfs since the first version of the RFC patch. I'm
> > not sure which changelog to put it in.
>
> I was thinking to put the reason(s) of choosing sysfs over configfs-tsm t=
o the
> changelog of this patch, as I had impression the ABI to expose MRs is als=
o for
> attestation or at least attestation related.
>
> [...]
>
> > > I think it is still valid question that whether we need to make those=
 MRs
> > > consistent for all vendors for the purpose of providing a unified ABI=
 to
> > > userspace.
> > >
> > > IIUC, Dan has been wanting unified ABIs around attestation.  It would=
 be great
> > > if Dan can provide guidance here.
> > >
> > Yes, Dan and I had discussed this long ago. Just a bit clarification
> > here, this ABI is mainly measurement but not for attestation.
> >
> > Given the lack of unified HW from different vendors, there cannot be a
> > low level unified ABI.
> >
>
> Ok as long as Dan is fine.
>
> > A higher level ABI (with HW specifics abstracted
> > away) was once proposed - i.e., the log oriented ABI. But it turned out
> > difficult to agree upon a log format. Anyway, the abstraction doesn't
> > have to be done in kernel mode, as long as MRs are made accessible to
> > user mode. This patch is laying the groundwork for that.
>
> Thanks for the info.
>
> Maybe it's also worth to put this into the changelog of this patch too, s=
o that
> readers can at least know why we didn't choose to unify the ABI.
>
> >
> > [...]
> > > > > Please correct me if I am wrong: in my understanding, the purpose=
 is to provide
> > > > > a "unified ABI for usrspace" for MRs, but not just some common in=
frastructure in
> > > > > the kernel to support exposing MRs, right?
> > > > >
> > > > > Configfs-tsm provides consistent names for all attributes for all=
 vendors:
> > > > > 'inblob', 'outblob', 'generation', 'provider' etc, so it provides=
 a unified ABI
> > > > > for userspace.
> > > > >
> > > > "attestation reports" in this configfs context refers to opaque blo=
bs
> > > > consumed by external parties, while the guest acts as the "wire" fo=
r
> > > > transporting the reports.
> > >
> > > I interpret this as there's no requirement for containers to *read* t=
hose MRs
> > > independently via configfs-tsm. :-)
> > >
> > Yes and no. Containers have the need to read MRs, but doesn't have (the
> > need) to verify them (and the credentials backing them). It is a
> > separate question whether to read MRs via sysfs or configfs. The
> > structure of configfs-tsm is optimized for usages that doesn't require
> > parsing/interpreting the quotes from within the guest, while The
> > structure of sysfs-tsm is optimized for the opposite.
>
> I think we can also parse the quote from the configfs-tsm if apps want, o=
r we
> can also introduce new configfs-tsm attributes for individual MRs if need=
ed.
> But I think the key reason we choose sysfs for MRs is they are platform g=
lobal
> while configfs-tsm fits per-application more.
>
> >
> > Please note that, at least in the case of TDX, quotes have a lot bigger
> > TCB than TDREPORTs, so shouldn't be used unless TDREPORTs cannot serve
> > the same purpose.
>
> I think another concern is the Quote format may not be stable (e.g., for =
those
> signed by different QEs), i.e., the location of the TDREPORT in the Quote=
 may be
> different.  Right?
>
> >
> > > >
> > > > > But here actually each vendor will have its own directory.  E.g.,=
 for TDX we
> > > > > have:
> > > > >
> > > > >         /sys/kernel/tsm/tdx/...
> > > > >
> > > > > And the actual MRs under the vendor-specific directory are comple=
tely vendor-
> > > > > specific.  E.g., as shown in the last patch, for TDX we have: mrc=
onfigid,
> > > > > mrowner etc.  And for other vendors they are free to register MRs=
 on their own.
> > > > >
> > > > In contrast, MRs (especially extensible/RT MRs) are consumed by the
> > > > guest itself.
> > > >
> > >
> > > Yeah agreed.  But eventually they are for attestation, right?
> > >
> > No. From the perspective of this ABI, MRs are "mainly" for measurement.
> > By "mainly", I mean there are MRs like MRCONFIGID on TDX and HOSTDATA o=
n
> > SEV, that are simply immutable storage.
> >
>
> I wish we can have a more common name rather than "Measurement Registers"=
, but
> we are already here. :-)

The IETF RATS working group has proposed a general measurement type of
"integrity registers" in the CoRIM draft spec to accommodate PCRs and
RTMRs.
/shrug

>
> > They are needed by applications
> > for verifying, for example, security policies that must be enforced.
> >
>
> I appreciate if youy could elaborate a little bit?  E.g., reading MRCNOFI=
GID
> could be used for enforcing what kinda security policy?
>
> > Do
> > you see the need for reading them now?
>
> No.
>
> >
> > > > They are vendor specific because they are _indeed_ vendor
> > > > specific. The intention is to unlock access to all of them for user
> > > > mode.
> > > >
> > >
> > > Agreed.
> > >
> > > > The semantics (i.e., which MR stores what measurement) is
> > > > application specific and will be assigned by the application.
> > >
> > > This doesn't mean the kernel shouldn't provide a unified ABI to users=
pace
> > > AFAICT.
> > >
> > A log oriented ABI was once proposed, but we failed to reach an
> > agreement on the log format. Moreover, this may be a problem better
> > solved in user space.
> >
> > > >
> > > > > Could you elaborate how userspace is supposed to use those MRs in=
 a common way?
> > > > >
> > > > > Or this is not the purpose?
> > > > >
> > > > Sure. For example, CoCo may require storing container measurements =
into
> > > > an RTMR. Then, a potential implementation could extend those
> > > > measurements to an "RTMR file" named "container_mr", which could be=
 a
> > > > symlink pointing to different RTMRs on different archs.
> > >
> > > OK.
> > >
> > > >
> > > > Of course, we are hand-waiving the potential difference in the
> > > > number/naming of the MRs and the hash algorithms they use in the ex=
ample
> > > > above.
> > >
> > > I think the number is fine.  E.g., in the above case, the application=
 could have
> > > a policy to map a given container measurement to one RTMR (e.g., cont=
ainer0 ->
> > > rtmr0 and so on).
> > >
> > > And I am not sure why hash algorithm matters?  If needed, there could=
 be a
> > > policy to query the hash algorithm for a given RTMR and feed extended=
 data based
> > > on the algo in each loop.
> > >
> > The existence of a "mapping policy" implies the application is aware of
> > the underlying HW, meaning the application cannot work on new HW
> > released after the application.
> >
> > "Querying hash algorithm" will work only if the application is aware
> > (and carries the implementation) of the hash. This was how crypto
> > agility got introduced into TPM2.0, as old applications can't understan=
d
> > new hash algos.
> >
> > IMHO, what's really required by applications/attesters is the ability t=
o
> > log "events" (e.g., a container signed by a specific authority has been
> > loaded/started), while what's required by verifiers/appraisers is the
> > ability to verify those "events". Neither party has the need to
> > understand the HW specifics (number/names of MRs and hash algos).
> > Therefore, an ideal solution should be log oriented: Applications appen=
d
> > "events" to logs while verifiers extract "events" from logs, with the H=
W
> > specifics encapsulated in a separate "bottom layer". This ABI is part o=
f
> > that "bottom layer", upon which the rest of the stack can be built out
> > in user space.
>
> Yeah thanks for the explanation.  As long as Dan is fine with this "botto=
m
> layer" all good :-)
>
> Thanks again for the detailed reply!
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
