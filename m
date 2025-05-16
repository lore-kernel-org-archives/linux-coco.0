Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD7145323
	for <linux-coco@lists.linux.dev>; Fri, 16 May 2025 06:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747375361; cv=none; b=bCHzoEApGZi4e04PWBKiYR9SZ4lSu9TRnSd6mdbawobSlKrARkzSe9tSm5ikWnSbg5YQBcRS0viTqogY9e/hRw6wcZ41kaO3IywF6GYmof1lYhq7c/smCEQyMXJ2H/E004+pQ6q8G/YwzDsrQmOLh9OIpwCo2L7oZ50dV7BsOW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747375361; c=relaxed/simple;
	bh=86KNY77YANd8HqsULvUmmsa4lrPwhFldYHjbTzwWOB4=;
	h=Mime-Version:Subject:From:In-Reply-To:Date:Cc:Message-Id:
	 References:To:Content-Type; b=S67+kRruJqd56CRxQJeJAHNMqg743GNTZHDawMzt4yGgcBz/WpSwwk9EdWWGs8bPkaw/1cb2Y9KpcZpCWoVG3McD4LBXvP1AIZgS3Xz/+cLvxuO7VlonIkKsd/PNQFD9/ucjANgZuX5RgasFzSvjxxJHhbtvPN+9XkIrf112/ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RWVFDvbR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RWVFDvbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747375358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nM/oIUxfHX6IMgZR7JqI6MtdpYAzy9Nsk2ekFzlHEpQ=;
	b=RWVFDvbRKC7CXF6z/odQdTHhkjA1otXP+3Mx5K3ajlhmv/3GGB42hBHUeEQU2ZWpYQx68P
	IEseXlxFkKi+maUCclaEEvqNRb7TyqMgfpoIzY9rQ4ZMnvJw4U5d7UDa5wyHiZGaXgO2ZB
	14cBgz0tLC67gu/pvHd2xdwxYPXtuX8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-HrXpH91lO9CkjG9FCAuB6A-1; Fri, 16 May 2025 02:02:36 -0400
X-MC-Unique: HrXpH91lO9CkjG9FCAuB6A-1
X-Mimecast-MFC-AGG-ID: HrXpH91lO9CkjG9FCAuB6A_1747375356
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso1221970b3a.0
        for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 23:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747375354; x=1747980154;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+tGAE/w+diw6CvOkP1TaG9M2cQ4uQBP8cfPxaVAOdE=;
        b=TVi4+G99c+0RLksDPNIb0hxcviN8P5InqCIwLrFP1hz4Y2krVRnJSsMCYlaUw0UxH8
         m4Z1a6muyS3npx4YUCsn80+U3FEfM91h7psWAsOnX80O4oez+O2ACFJnwxfKBZq6KUXO
         52PeahCrAYIcY/BYqRA27IaXCs/7KRi6nR6/e8IxpEyDYxz9CXJ95yNxW0InHpMsZW/K
         tKQtEbVW3kxbOgbGb5Pg4GcxNpulrctHpxOi9bAuZqA+TMTMJlnT5TGEkGkwPFlf6rNV
         qgjy2o7lQ+uOJlNz61d+HbASZivapypP0uSOtoELKFFYsPV6gZp12iIFly4PJ4lkGNfV
         yvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqh3EuRQuAqHar5xFeBNOMPiQZSVnpJ1DlCPEbHwdXDCky0gz32hm1mLf7Kl25JNLTUDCQQR1WMpFn@lists.linux.dev
X-Gm-Message-State: AOJu0YzmdmttkoQhR7/nmu4VQEzb4rlewnWTW7Q48ALj0XLvMAcb3Jm+
	akcol2tGKvYrcvxeS63d+LwjGhVsuEZuqm7jWraC7pyjV2X7NYLBBe9gtWBLsSSR88X5bZyBPEr
	H7PqWwBslhy8EQmAMJv5Wn/8bUFeupufhrDXfotP+IsByCUBSilglL+EayLPIMVY=
X-Gm-Gg: ASbGncv3a7Ed26Tjaatn7rCJn2oYklhQM7ZyJjtQQ+AQQIkMc4WQ5JbLzOhuPuWHoow
	mJ3grU+ucNbJSVba0UQTcPDYSricfnmuoDiX4CnMQUVgVu+mJq8jNsF7IOqlQLDHvOdU7P8F06o
	dqEp81Doe4k/fojPy6TlEnUjhqlwxj8imoQ+Z6gWfAtQPmx3qBwIr3UrjCZRV46KJVoJ3BZU86i
	XMHYySThgOuD+am3tH/ZM4G1aWeo/3uAHKQDLrVHB3O9qOA1B1/+RsZyfQ5yRTsmU01q0Ngxmvo
	U2PO4OMnM/wgAWqPM3RX+MGWlHmV
X-Received: by 2002:a05:6a21:3a45:b0:1f5:8dea:bb93 with SMTP id adf61e73a8af0-2170cb07df4mr2240008637.7.1747375354383;
        Thu, 15 May 2025 23:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh11z5fKTSHivV0fw8sfQLZidzf3dXzJS4Et4+CzKhxj9Ro4It11glznHNG9jS8r2py+YfsA==
X-Received: by 2002:a05:6a21:3a45:b0:1f5:8dea:bb93 with SMTP id adf61e73a8af0-2170cb07df4mr2239959637.7.1747375353774;
        Thu, 15 May 2025 23:02:33 -0700 (PDT)
Received: from smtpclient.apple ([115.96.197.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ad2sm807567b3a.93.2025.05.15.23.02.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 May 2025 23:02:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com>
Date: Fri, 16 May 2025 11:32:16 +0530
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>,
 Steve Rutherford <srutherford@google.com>,
 linux-coco@lists.linux.dev,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Joerg Roedel <jroedel@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Jon Lange <jlange@microsoft.com>,
 "cho@microsoft.com" <cho@microsoft.com>,
 Alexander Graf <graf@amazon.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Message-Id: <100D7ECF-1292-450A-9F65-FEBA5843AB99@redhat.com>
References: <CAAH4kHZ2yO3ju_iJinR9y4BDXXdWBnEP1wcv09JWMzaqp1ZP+g@mail.gmail.com>
 <CAK3XEhOs4ijnbqmv8UrNmKN4=nv6+_A7fESLibGBRR9u8rXi6w@mail.gmail.com>
 <87frifm75c.fsf@redhat.com>
 <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
 <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
 <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com>
To: Dan Middleton <dan.middleton@linux.intel.com>
X-Mailer: Apple Mail (2.3776.700.51.11.2)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SqksEAPaLGe5aTEtqkztA7Mt7BwH53-mcKeXa3VUxEA_1747375356
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Is there any interest in sending a joint proposal in the upcoming KVM Forum=
 based on the updated, latest incarnation of the idea? We can send a propos=
al now (deadline is June 9th I believe) and then work on the details in the=
 subsequent weeks. I think we should be able to solidify the specifics of t=
he hypervisor interface. When we presented this idea last year in the KVM f=
orum, it was quite a bit fuzzy and we did not explore the IGVM angle at dep=
th.=20
So in my opinion, it will be a much better talk this time particularly with=
 everyone (all major hyperscalers) showing interest on this.

Thanks
Ani
=20

> On 12 May 2025, at 9:51=E2=80=AFPM, Dan Middleton <dan.middleton@linux.in=
tel.com> wrote:
>=20
> The recording is now available:
> https://www.youtube.com/watch?v=3Dbio5BGhjui4
>=20
> Additional Minutes:
> https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIl=
K2_bd4/edit?tab=3Dt.0#heading=3Dh.4qh5zyiozbow=20
>=20
> Really interesting discussion.
> Great that the discussion could be recruited on short notice.
> Sounds like follow-up might be over a thread here, with those not
> subscribed to linux-coco added directly.
>=20
> Keep in mind that the next SIG session is available and you can not only
> show pictures there, but can gesture and point to the same things to
> clarify.. I don't understand this stage, this widget, this format.
>=20
> Thanks,
> Dan
>=20
> On 5/8/25 12:29 PM, Dionna Amalie Glaze wrote:
>> Thanks everyone who could attend the CCC Linux Kernel SIG meeting
>> about FUKI and specifically the firmware replacement mechanism.
>> Please +cc any participants I missed.
>> Meeting minutes:
>> * the concept from its initial version that was Qemu-specific and used
>> specially-named FwCfg files to direct CVM context reconstruction with
>> a different ROM.
>> * the viewpoint of generalizing that interface to be an IGVM-based
>> firmware loading instruction in order to reduce the interface's
>> interpretation requirements to keep focused on an emerging standard.
>> * the usefulness of "single artifact" VM template distribution, such
>> that the firmware can be disk-image specific and not need extra
>> orchestration to lead to VM construction.
>> * constraints of the different VMM providers, namely
>>    + AWS does not have access to guest resources. A disk can only be
>> read by a guest VM.
>>    + Azure doesn't have this constraint and does not want to build a
>> stage 1 VM just to tear it down to boot a stage 2 VM every cold reset.
>> It's far more preferable for the host to have the option to determine
>> if an IGVM will be requested to load, in which case it should be
>> loaded directly without VM construction.
>>    + GCP emulates Qemu devices and could implement the FUKI interface,
>> but would prefer to use mechanisms that are standardized through
>> professional bodies like the UEFI forum. Faster boots without VM
>> reconstruction are also highly desirable.
>> Jon requested for Alex to give some more design consideration into a
>> mechanism that would satisfy both AWS and Azure's constraints.
>> Alex suggested the framework of a solution: mount the guest image,
>> search the boot partition for a specially named IGVM file, and launch
>> that instead of the CSP's firmware.
>> (Dionna notes outside of the meeting that this has the danger of being
>> an unsound optimization of directly loading the disk image under the
>> CSP firmware for FUKI application to load the IGVM due to no
>> requirement that the FUKI application load that specific IGVM file)
>> I look forward to our further discussion on how to provide a more
>> trustworthy Confidential Computing experience in the Cloud for our
>> customers :)
>> On Wed, May 7, 2025 at 4:04=E2=80=AFPM Steve Rutherford <srutherford@goo=
gle.com> wrote:
>>>=20
>>> Heads up, this meeting is tomorrow, May 8th at 9AM PDT (6PM CEST), if
>>> you all are available.
>>>=20
>>> On Fri, Apr 11, 2025 at 1:31=E2=80=AFAM Vitaly Kuznetsov <vkuznets@redh=
at.com> wrote:
>>>>=20
>>>> Ani Sinha <anisinha@redhat.com> writes:
>>>>=20
>>>>> Adding Vitaly as well who is also involved in this project from Red H=
at.
>>>>>=20
>>>>> On Fri, Apr 11, 2025 at 4:46=E2=80=AFAM Dionna Amalie Glaze
>>>>> <dionnaglaze@google.com> wrote:
>>>>>>=20
>>>>>> Hi y'all, my colleague Steve Rutherford runs a monthly special
>>>>>> interest group meeting amongst Linux kernel developers under the
>>>>>> confidential computing consortium umbrella.
>>>>>>=20
>>>>>> The f-UKI concept presented at FOSDEM is a very interesting idea for
>>>>>> improving customer trust in cloud confidential VMs without the need
>>>>>> for complex control plane resource management for virtual firmware
>>>>>> EEPROM.
>>>>>>=20
>>>>>> Microsoft has proposed a firmware loading format called IGVM that th=
e
>>>>>> Coconut-SVSM project has adopted, and has support in Vanadium
>>>>>> (Google's KVM-based VMM), Qemu, and OpenVMM (donated to the CCC).
>>>>>>=20
>>>>>> I see Alexander from AWS in the Qemu threads for vmfwupdate, so now
>>>>>> that's at least the top 3 CSPs represented here.
>>>>>>=20
>>>>>> I think for everyone in the To: tag here, we all have a vested
>>>>>> interest in improving the CVM trust story without making the
>>>>>> virtualization ecosystem even more challenging to work with. I'd lik=
e
>>>>>> to invite you all to our next meeting
>>>>>>=20
>>>>>> 9am PDT May 8th: https://confidentialcomputing.io/get-involved/calen=
dar/
>>>>>>=20
>>>>=20
>>>> Hi Ani, Dionna, everyone,
>>>>=20
>>>> I'd be delighted to participate! May, 8th, however, is a public holida=
y
>>>> in some European countries including CZ where I'm based and I will be
>>>> traveling on that day so I may not be able to join. I'm, however, pret=
ty
>>>> certain that Ani/Alex/Gerd can represent the idea very well)
>>>>=20
>>>> --
>>>> Vitaly
>>>>=20
>=20

