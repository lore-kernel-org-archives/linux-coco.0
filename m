Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703D93B5832
	for <linux-coco@lists.linux.dev>; Thu,  9 Apr 2026 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775747980; cv=none; b=imFsDUFsxA22pNQs9bxjzfHdjLCNFnTEuLuvvpaYfU/c0TCbHFDrq1Le2T7P7VjsdrX2/NBq8iBYpmjNMcA216kPXDorJfCvw35nue2RLDTLDtK5c50wgUEHMKVWfHuMlXrvaQY9iK/qEPc/7OSycSstXHXegSG0P2h+0wbrChU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775747980; c=relaxed/simple;
	bh=kJuSzV/a9VZgvsyiqbs9gRWnFA23MYPxesTOVgY4440=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIQFAUKKPd3lZvD/7d3WhXZbqAutdfrK9ok7julrU6P4DwaHa1Tk5OkjjUj5rWRyExVlhcsRQ0RNisdG8wRaxIqJIOL5XU86VfSXAeMmzvUeSmduG3ACHuy4OYqFr2hO4cE7sRN6FRuPfjK0tAwRfsxgFEPeKI9Akyr5FThdWrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WBr3G1wu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WBr3G1wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775747978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJuSzV/a9VZgvsyiqbs9gRWnFA23MYPxesTOVgY4440=;
	b=WBr3G1wuhRSFJNjsa1IBFeMdeBGTSsXTJe7QsdDOf8Qs8zNSblAP2bGw905cNMvELBmzcH
	Zd7olJpQqIyQapcxF6NsdX8n+pkNsPCLJz9lnzojfPzXrr+LmkSGWY9zcF60sy4Q2PamPk
	BT/k7bS5EU1XKMJEesjSZOJUvDWoio4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-hb6Y0nZQOn6Aa96ehyupNA-1; Thu, 09 Apr 2026 11:19:37 -0400
X-MC-Unique: hb6Y0nZQOn6Aa96ehyupNA-1
X-Mimecast-MFC-AGG-ID: hb6Y0nZQOn6Aa96ehyupNA_1775747976
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242cbb97aso9638435ad.1
        for <linux-coco@lists.linux.dev>; Thu, 09 Apr 2026 08:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747976; x=1776352776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kJuSzV/a9VZgvsyiqbs9gRWnFA23MYPxesTOVgY4440=;
        b=j7IyQX+GtEhnqDhpAdzGrm7rXqOw2/z1cJ5R22EW6Jr95QWqgo6hhPdpUcv2sKHsPz
         ZPpqb6Lq1K/Zh5X/c/VwPoeQKjMnYP3Xu0Cnn/rjGBmwdmm4EfGPpZwzIpqyYU6va1+L
         90leuJsh+c7KusLd8ZObZoVmHd3Q+Z5GbqyGJupYJwyvpqG9FSX5p4KS3CVMBQHrWUSv
         HS6on1d+u/AKJTmdl3s/PcbFdCuoLc9gxHht/jSGHmmJMyrMzqejZTe73XdPJT5LsbuJ
         1N0nPTueqTQy1f7UkUGRnJhqrJ78JaM+6hX4mHlviUKHIDf0wUQvpPFs8pI1JRd9CDgD
         d2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnEjRZsfSWvOTcI3e1jA1Dz6kP37ZDGJFhr1Vg640O6qYQ5jlyNZlcVJuB5901MImf4CZk4vN4MdJq@lists.linux.dev
X-Gm-Message-State: AOJu0YwsSJjujcj7T2ner8eGhrTnGkUNRjnlL+IWAuy8G8jAu9z5E4An
	7rt5hzdSW8U+tx4Moe9mcUBtey9n7LYqKvGZT7sKWEJGLahyzOhTN4sDBTMfoxDM1Q1t650u+A/
	4M6fVvaGWHP2T92T1mkAeWB7SIbim5Od4KwV03bi2+tbWW9YNjTT+GcfVmqx5RLFp41ruHfy2d3
	2i84a6TfP3YFqGL7uW2hkmAgAmSIrCF9+h424OQQ==
X-Gm-Gg: AeBDievAFsh/AIS3WP7ElEyfy4j0wHMLsLrFP5dW2hlImSrZ0FC8kxeAFaHDVpXGXa9
	jAC3QvHFiQB/2X5opHxggEfeWhupsT8B7yDWNFMOsscuIZIq4J6Q5BHTt4fPmWZ0geBH2R6KLkh
	Sh8iJDnA1S2AYVnd5JteRRiOt9r0Q0Sb8oqOkDqOtpwckprgRv92s8fwW2G7rvoktJVydt5/w4C
	ifbpjf0tGGRGBj5OQMbYr0jPvTwoCzjyYwfvFvkrckaZYdOveRuDk4chSPR3M2G+wy1jj+sb6zl
	FeKT9lw5qQiFuzURep1s1QhL
X-Received: by 2002:a17:902:ccc9:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b281889829mr279189155ad.41.1775747976173;
        Thu, 09 Apr 2026 08:19:36 -0700 (PDT)
X-Received: by 2002:a17:902:ccc9:b0:2b0:7e4d:f43f with SMTP id
 d9443c01a7336-2b281889829mr279188715ad.41.1775747975533; Thu, 09 Apr 2026
 08:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324-tdx-hotplug-fixes-v1-0-8f29f2c17278@redhat.com>
 <20260324-tdx-hotplug-fixes-v1-2-8f29f2c17278@redhat.com> <56190adc345148396ba6b3e52672e662145f7dc7.camel@intel.com>
 <CAMxuvaytU-pM+rviUbNGWMhvbAYutwvaSXW_O=sn+QfOzF35Xw@mail.gmail.com>
 <7802b50589c80a7276a50cc473c1aa579750a30c.camel@intel.com>
 <CABgObfZ7_w8Q-dW=Sd4YA3P==BuN1edPv7Ty4EpPyU8ctW6RLg@mail.gmail.com>
 <424048885a01dcb6a7ef0256f0dc8a9adb546f22.camel@intel.com>
 <cab5371d-e0f4-42b7-bae9-2c7f981b26b2@amd.com> <49e8b24d836c1883e83ad72d1ab279f9e3eb7455.camel@intel.com>
 <IA1PR11MB949557E04741169BA209A69EE751A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <9b1290bbc1283a2f35bdcd177d27ae7aea89151c.camel@intel.com>
 <IA1PR11MB94952B22F6EB648ED7C1AE3CE75EA@IA1PR11MB9495.namprd11.prod.outlook.com>
 <f4639348586233245343005708372230f2d4a2cc.camel@intel.com> <IA3PR11MB91365041D42CB7F53DA5A98092582@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB91365041D42CB7F53DA5A98092582@IA3PR11MB9136.namprd11.prod.outlook.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 9 Apr 2026 19:19:23 +0400
X-Gm-Features: AQROBzCNYZ-DGOdlyKWXr6NNDhhPUzZQi2ewXWlEjaBIziQmvgTY9Fsj425SYDw
Message-ID: <CAMxuvawVL7-9+8U=Yf7_pJcsbCivgJqFStrXAtAaiBEqtZnc1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/tdx: Accept hotplugged memory before online
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>, David Hildenbrand <david@kernel.org>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"Reshetova, Elena" <elena.reshetova@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"prsampat@amd.com" <prsampat@amd.com>, "x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"bp@alien8.de" <bp@alien8.de>, "Qiang, Chenyi" <chenyi.qiang@intel.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LnTl8vcJlTcVIG4XyptrNpXCmjTDhiblMWEqeojnLKs_1775747976
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Apr 9, 2026 at 5:36=E2=80=AFAM Duan, Zhenzhong <zhenzhong.duan@inte=
l.com> wrote:
>
>
>
> >-----Original Message-----
> >From: Edgecombe, Rick P <rick.p.edgecombe@intel.com>
> >Subject: Re: [PATCH 2/2] x86/tdx: Accept hotplugged memory before online
> >
> >On Fri, 2026-04-03 at 10:37 +0000, Reshetova, Elena wrote:
> >> > > > So the part about whether a triggered accept succeeds or returns=
 an
> >> > > > already accepted error is already under the control of the host.=
 > >
> >> > > > I.e., if we don't have the zeroing behavior, the host can alread=
y > >
> >> > > > cause the page to get zeroed. So I don't think anything is > >
> >> > > > regressed. Both come down to how careful the guest is about what=
 it > >
> >> > > > accepts.
> >> >
> >> > Yes, and my point is that we should not allow guest to freely double
> >> > accepting ever.
> >> > For any use case that requires releasing memory and accepting it > b=
ack, it
> >> > should be explicit action by the guest to track that memory > has be=
en
> >> > "released" (under correct and safe conditions) and then it > is ok t=
o accept
> >> > it back (even if it doesnt mean physically accepting > it) and in th=
is case
> >> > it is ok (and even strongly desired) to zero the > page to simulate =
the
> >> > normal accept behaviour.
> >
> >Hmm, it doesn't seem like you engaged with my point. Or at least I'm not
> >following what is exposed?
> >
> >So I'm going to assume you agree that this procedure would not open up a=
ny
> >specific new capabilities for the host that don't exist today. And inste=
ad you
> >are just saying that the guest should have infrastructure to not double =
accept
> >memory in the first place.
> >
> >But the problem here is not that the guest losing track of the accept st=
ate
> >actually. It is that the guest relies on the host to actually zap the S-=
EPT
> >before re-plugging memory at the same physical address space. So the gue=
st is
> >tracking that the memory is released correctly. Better tracking will not=
 help.
> >It relies on host behavior to not hit a double accept.
> >
> >TDX connect will use this "unaccept" seamcall, so I asked Zhenzhong (Cce=
d) how
> >much of what we need for that solution will just get added for TDX conne=
ct
> >anyway. It seems like we should make sure the same solution will work fo=
r both
> >SNP and TDX and keep the options open at this stage.
>
> For that solution, analog to hotplug, TDX Connect needs a hot-unplug hand=
ler to
> use "release" seamcall to unaccept private memory before unplug, that's i=
t. But
> if the zapping S-EPT will not happen in host, I think this "release" seam=
call is also
> unnecessary for TDX Connect.
>
> I also have a silly question which I looked over this thread and didn't f=
ind answer.
> Do we have to support private memory hotplug, what benefit we get to supp=
ort it?
> If we only allow shared memory plug/unplug to TD, then we don't need this=
 series.
> Guest decides to convert shared memory to private after plug and do the o=
pposite before unplug.
> This works for both TDX connect and memory unplug as memory release is im=
plicitly triggered
> in memory convert.

I did some successful experiments with modified QEMU & kernel, this
seems to work.

On virtio-mem plug, set_memory_encrypted() makes the memory private +
accepted. On unplug, make it return to shared with
set_memory_decrypted(). QEMU handles REQ_UNPLUG and can punch both
shared & guest_memfd planes (which will TDH.MEM.PAGE.REMOVE).
Re-plugging also works fine.

The virtio spec should probably be updated to explicitly define the
shared state on unplug and the private state on plug, driven by the
guest/driver. Those are KVM memory attributes, I suppose this is
generic enough.

