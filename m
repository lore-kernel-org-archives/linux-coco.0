Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E1913B58D
	for <linux-coco@lists.linux.dev>; Mon, 19 May 2025 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643920; cv=none; b=h0phkOMI69Dme5ZSDJ3hbRtE1MT0nLk/4XF52TfUUYn1tz1wo7tiUSAhJjWBsWL1sRvg6qmQATxfPnBq8FGL3nbpWscTzwZmfW1esNkvSWtQlTKQiv/iaSB1gDwJJN2f9bIuneEdGykeoMcr0yo7PYfTVJ7joqRoEn2QHuTV9+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643920; c=relaxed/simple;
	bh=yN99FKnW4ZTqhmcgfl2pxuzv4f6fMQB07z2u3Skp5kc=;
	h=Mime-Version:Subject:From:In-Reply-To:Date:Cc:Message-Id:
	 References:To:Content-Type; b=eeZPAbLpQkYbFYTBsUoO52GILk1DxokMeTsnynLLZ9rOkZET0kTIU2EtpOkk7rvMRQVykjh4v+xrSL+gvlgr6v9wZp9pEOQAVBJf1BlKJ8r6JYI8V2AO1pO8djIBgydCz9anB7DJsDOeReHbA6IdCaoH1E2zBMyne0fBdB5fteQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f1ksLVDH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f1ksLVDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747643916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54bz+5OlBqRTLNSZ62DupV/b8NHlbvrw05YZniHdZjc=;
	b=f1ksLVDHr1HcIWJWICA7JuENVo5A+raw9i1P+zsR/l3wBvNicH+7oDtlRAHOkd7bEWoocc
	nNu+1O4UqUwrlqGIT7/gAw04bzC9I5a+tDgtnXlkZoBCHD0SjBL/Yvj44OQh3W53EiuBxf
	25pKLJ1vcIsIjB+3hlUFvAH1+h6DhCs=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-QUEfGjD_NSmn-m1zgqhyaA-1; Mon, 19 May 2025 04:38:35 -0400
X-MC-Unique: QUEfGjD_NSmn-m1zgqhyaA-1
X-Mimecast-MFC-AGG-ID: QUEfGjD_NSmn-m1zgqhyaA_1747643914
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so2590816a12.3
        for <linux-coco@lists.linux.dev>; Mon, 19 May 2025 01:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643911; x=1748248711;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+Gk/0pHrLZiuzjccjgTwvvILHRX6UcYfIa2oyRLjFw=;
        b=tyEdE6UVm9AMMc3/Ud9RgKmGtqdnBxFiDfvvMqzAagxTR49lJuU+bNsh3mpYOa9M8C
         +S+io7smCHUPxJl9XI5xsIdN3AdqisKmX1Kkh0Cfv4u8JYXkGNSdkuwTllXUmS6f7C+S
         Zwr6CmIaHvXzU99OOrC25wacgAo/yjQoma6KYYWmKQDjb+VVaoIiUcEE1r1ird07aPEa
         rAxWGhPTtVPPEXbaIDQFCQQNzcCEhoDhqvQhHhI2fM08fJ2Cq98I8c72ZfhNIXPZa7MG
         T3GWe+fkUGH4Eg4oGC+4O+7hTEZ58/P8x8qxzKVAi8WFx4FEyD/8B9Fpyq8QQE4nMpYt
         i69Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFhwOKJ6zAudI+9c0S1AQDrH8ittNzCs1nbBWzu8XHr80FbwFMALLNhYcec3S0296YqM0b7BfrkInb@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3A2ch2b3Xor5bmG5NOJ8/YIC6wBfhcARy5FWZEgjHO7ZnDaEh
	gSf30udr7zoFLVQCYMyhmTpt0m9K5qAn5I7EuW6Mn7lTK9fMMK1iGzmaFrF7uZiuynhvpQCJ2qe
	iuEw70CYXBrP87ZkK955+zRbqnkWlXF64mKIjpT99cxNsSMRsSHKJrEnNmMIY6iU=
X-Gm-Gg: ASbGncuyPMgjLvLgS1t8w6v7dC3U6ozt697T+Gm+LpwEzFVrRpdxdUbPrLKRE3gp9B4
	vV4TlRuUuKOZlqICFhZTMuYMpcUnb0K3XVxnOjqsINzodeIddmA/JBSXdAkt3GCwlCS5ZeoN+fx
	GVfY+D+Nu1qYZzbbA6rTHVPdV7Wd0wWi+6PHd9vyghEwo0P3ihqFx7X1B/6YZPoSwTvzgJ6z2bA
	slh7sCH9H+A7U1TigZGkSdOdvuX9KPwnnffCo7+cLl/0Cds6hYylCs7Qx+0CP7uS8DMBE+tCgFU
	s6XYlMcWeYRHM2COLOMk2t0pz7LmzKYp
X-Received: by 2002:a17:90b:3d85:b0:2f9:d9fe:e72e with SMTP id 98e67ed59e1d1-30e8312dcd2mr22524204a91.16.1747643911194;
        Mon, 19 May 2025 01:38:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5LGWn1wT5uIAHp9X4y+C92pGXIcuoPjpLbYHS6Z5Ppw+CZIciM/VRPs3nEAxxORuwsLFTvA==
X-Received: by 2002:a17:90b:3d85:b0:2f9:d9fe:e72e with SMTP id 98e67ed59e1d1-30e8312dcd2mr22524155a91.16.1747643910587;
        Mon, 19 May 2025 01:38:30 -0700 (PDT)
Received: from smtpclient.apple ([171.79.90.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e833da84csm5854335a91.10.2025.05.19.01.38.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 May 2025 01:38:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <7c650817-09d9-4c41-96db-62c0950d71d5@amazon.com>
Date: Mon, 19 May 2025 14:07:42 +0530
Cc: Dan Middleton <dan.middleton@linux.intel.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 Steve Rutherford <srutherford@google.com>,
 linux-coco@lists.linux.dev,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Joerg Roedel <jroedel@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Jon Lange <jlange@microsoft.com>,
 "cho@microsoft.com" <cho@microsoft.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Message-Id: <0E0BB5C5-457F-49B3-A61D-98BCD10CC430@redhat.com>
References: <CAAH4kHZ2yO3ju_iJinR9y4BDXXdWBnEP1wcv09JWMzaqp1ZP+g@mail.gmail.com>
 <CAK3XEhOs4ijnbqmv8UrNmKN4=nv6+_A7fESLibGBRR9u8rXi6w@mail.gmail.com>
 <87frifm75c.fsf@redhat.com>
 <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
 <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
 <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com>
 <100D7ECF-1292-450A-9F65-FEBA5843AB99@redhat.com>
 <7c650817-09d9-4c41-96db-62c0950d71d5@amazon.com>
To: Alexander Graf <graf@amazon.com>
X-Mailer: Apple Mail (2.3776.700.51.11.2)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N0cKF4t5nqtULR9ssaKnrKNxRfjvXVqBP1JMb00CDLc_1747643914
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 16 May 2025, at 2:55=E2=80=AFPM, Alexander Graf <graf@amazon.com> wrot=
e:
>=20
> Hey Ani,
>=20
> We already presented concepts last year. If we want to preserve credibili=
ty, this year we need to show a solution that's either merged or almost mer=
ged upstream and ready to use.

Hmm ok I think it will be hard to get anything merged before the deadline o=
n June 9th.=20

>=20
> Alex
>=20
> On 16.05.25 08:02, Ani Sinha wrote:
>> Is there any interest in sending a joint proposal in the upcoming KVM Fo=
rum based on the updated, latest incarnation of the idea? We can send a pro=
posal now (deadline is June 9th I believe) and then work on the details in =
the subsequent weeks. I think we should be able to solidify the specifics o=
f the hypervisor interface. When we presented this idea last year in the KV=
M forum, it was quite a bit fuzzy and we did not explore the IGVM angle at =
depth.
>> So in my opinion, it will be a much better talk this time particularly w=
ith everyone (all major hyperscalers) showing interest on this.
>>=20
>> Thanks
>> Ani
>>=20
>>=20
>>> On 12 May 2025, at 9:51=E2=80=AFPM, Dan Middleton <dan.middleton@linux.=
intel.com> wrote:
>>>=20
>>> The recording is now available:
>>> https://www.youtube.com/watch?v=3Dbio5BGhjui4
>>>=20
>>> Additional Minutes:
>>> https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzv=
IlK2_bd4/edit?tab=3Dt.0#heading=3Dh.4qh5zyiozbow
>>>=20
>>> Really interesting discussion.
>>> Great that the discussion could be recruited on short notice.
>>> Sounds like follow-up might be over a thread here, with those not
>>> subscribed to linux-coco added directly.
>>>=20
>>> Keep in mind that the next SIG session is available and you can not onl=
y
>>> show pictures there, but can gesture and point to the same things to
>>> clarify.. I don't understand this stage, this widget, this format.
>>>=20
>>> Thanks,
>>> Dan
>>>=20
>>> On 5/8/25 12:29 PM, Dionna Amalie Glaze wrote:
>>>> Thanks everyone who could attend the CCC Linux Kernel SIG meeting
>>>> about FUKI and specifically the firmware replacement mechanism.
>>>> Please +cc any participants I missed.
>>>> Meeting minutes:
>>>> * the concept from its initial version that was Qemu-specific and used
>>>> specially-named FwCfg files to direct CVM context reconstruction with
>>>> a different ROM.
>>>> * the viewpoint of generalizing that interface to be an IGVM-based
>>>> firmware loading instruction in order to reduce the interface's
>>>> interpretation requirements to keep focused on an emerging standard.
>>>> * the usefulness of "single artifact" VM template distribution, such
>>>> that the firmware can be disk-image specific and not need extra
>>>> orchestration to lead to VM construction.
>>>> * constraints of the different VMM providers, namely
>>>>    + AWS does not have access to guest resources. A disk can only be
>>>> read by a guest VM.
>>>>    + Azure doesn't have this constraint and does not want to build a
>>>> stage 1 VM just to tear it down to boot a stage 2 VM every cold reset.
>>>> It's far more preferable for the host to have the option to determine
>>>> if an IGVM will be requested to load, in which case it should be
>>>> loaded directly without VM construction.
>>>>    + GCP emulates Qemu devices and could implement the FUKI interface,
>>>> but would prefer to use mechanisms that are standardized through
>>>> professional bodies like the UEFI forum. Faster boots without VM
>>>> reconstruction are also highly desirable.
>>>> Jon requested for Alex to give some more design consideration into a
>>>> mechanism that would satisfy both AWS and Azure's constraints.
>>>> Alex suggested the framework of a solution: mount the guest image,
>>>> search the boot partition for a specially named IGVM file, and launch
>>>> that instead of the CSP's firmware.
>>>> (Dionna notes outside of the meeting that this has the danger of being
>>>> an unsound optimization of directly loading the disk image under the
>>>> CSP firmware for FUKI application to load the IGVM due to no
>>>> requirement that the FUKI application load that specific IGVM file)
>>>> I look forward to our further discussion on how to provide a more
>>>> trustworthy Confidential Computing experience in the Cloud for our
>>>> customers :)
>>>> On Wed, May 7, 2025 at 4:04=E2=80=AFPM Steve Rutherford <srutherford@g=
oogle.com> wrote:
>>>>> Heads up, this meeting is tomorrow, May 8th at 9AM PDT (6PM CEST), if
>>>>> you all are available.
>>>>>=20
>>>>> On Fri, Apr 11, 2025 at 1:31=E2=80=AFAM Vitaly Kuznetsov <vkuznets@re=
dhat.com> wrote:
>>>>>> Ani Sinha <anisinha@redhat.com> writes:
>>>>>>=20
>>>>>>> Adding Vitaly as well who is also involved in this project from Red=
 Hat.
>>>>>>>=20
>>>>>>> On Fri, Apr 11, 2025 at 4:46=E2=80=AFAM Dionna Amalie Glaze
>>>>>>> <dionnaglaze@google.com> wrote:
>>>>>>>> Hi y'all, my colleague Steve Rutherford runs a monthly special
>>>>>>>> interest group meeting amongst Linux kernel developers under the
>>>>>>>> confidential computing consortium umbrella.
>>>>>>>>=20
>>>>>>>> The f-UKI concept presented at FOSDEM is a very interesting idea f=
or
>>>>>>>> improving customer trust in cloud confidential VMs without the nee=
d
>>>>>>>> for complex control plane resource management for virtual firmware
>>>>>>>> EEPROM.
>>>>>>>>=20
>>>>>>>> Microsoft has proposed a firmware loading format called IGVM that =
the
>>>>>>>> Coconut-SVSM project has adopted, and has support in Vanadium
>>>>>>>> (Google's KVM-based VMM), Qemu, and OpenVMM (donated to the CCC).
>>>>>>>>=20
>>>>>>>> I see Alexander from AWS in the Qemu threads for vmfwupdate, so no=
w
>>>>>>>> that's at least the top 3 CSPs represented here.
>>>>>>>>=20
>>>>>>>> I think for everyone in the To: tag here, we all have a vested
>>>>>>>> interest in improving the CVM trust story without making the
>>>>>>>> virtualization ecosystem even more challenging to work with. I'd l=
ike
>>>>>>>> to invite you all to our next meeting
>>>>>>>>=20
>>>>>>>> 9am PDT May 8th: https://confidentialcomputing.io/get-involved/cal=
endar/
>>>>>>>>=20
>>>>>> Hi Ani, Dionna, everyone,
>>>>>>=20
>>>>>> I'd be delighted to participate! May, 8th, however, is a public holi=
day
>>>>>> in some European countries including CZ where I'm based and I will b=
e
>>>>>> traveling on that day so I may not be able to join. I'm, however, pr=
etty
>>>>>> certain that Ani/Alex/Gerd can represent the idea very well)
>>>>>>=20
>>>>>> --
>>>>>> Vitaly
>>>>>>=20
>=20
>=20
>=20
> Amazon Web Services Development Center Germany GmbH
> Tamara-Danz-Str. 13
> 10243 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
> Sitz: Berlin
> Ust-ID: DE 365 538 597

