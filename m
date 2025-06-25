Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03ED126C05
	for <linux-coco@lists.linux.dev>; Wed, 25 Jun 2025 07:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836135; cv=none; b=TxAQ4vBRXamVNDpvg3fE4NU+C5q1CD2lRBUiyG/qYGpgDkC3sY1NEp0TjJDdrt+bgc8DXiWqOFrFhUYOBEFQoOjBDn/1J9uEiMlz4ihGtwefsCu/wRqtGDlKLYaTbXu8ZniX7oX1lvRq/RUXCGug5Hc/RlXwUNG1C4veBjqcl1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836135; c=relaxed/simple;
	bh=ghrnFLz1JAOaa3NYqjakM7C34HYq8hzOK34MLCBOAU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHNSPwvusiUmlGBPs7dcXASDApCLgidzWFUZYeyKfyI3/QNTXJ1sXoePpz0XrMDDIyCHLvYo/MthijTOVZVEXm5O31ZBsbx4fu0ua0QoWT3s83cZmkQlH9WWRBgQsWcVmf6ZAtg1IBTkjDp9N72bJMyWS1aZInx4BjBn747YDRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X5yb7VZb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X5yb7VZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750836132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghrnFLz1JAOaa3NYqjakM7C34HYq8hzOK34MLCBOAU0=;
	b=X5yb7VZbegRLe7hFuvUP4tM+fQMAsBytKPSjgWbw1CYLH25X36I1hdDa9lCdA6q9CYUgSP
	fpUZahnQZlxGFs+FRue+rSdhcg4NkUz+jmsXZNvz0OBQZiHGDW7a0BjkNQmOBSIdlKcLN+
	Vtii1U2rN+UHl70ORhkW480tWq/Omyg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-fNXwE6hqOe-EOivn1uUHVg-1; Wed, 25 Jun 2025 03:22:11 -0400
X-MC-Unique: fNXwE6hqOe-EOivn1uUHVg-1
X-Mimecast-MFC-AGG-ID: fNXwE6hqOe-EOivn1uUHVg_1750836130
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad89a3bcc62so437706666b.0
        for <linux-coco@lists.linux.dev>; Wed, 25 Jun 2025 00:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836130; x=1751440930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghrnFLz1JAOaa3NYqjakM7C34HYq8hzOK34MLCBOAU0=;
        b=rPn0kW6jfl9qFTcnLFGnLPfPXvh/sMNPDOVJ85CIiIy5VNBFgcFIzoF57cTXQkA6pI
         Kl25777xCtJ+D2aNaA/ZCuKycuiO3bhJm8gcx5XHPq+c7YMRUtqVZME3JJnXcSkp8lbR
         /7XkhyRLwmWg60ncOYrprENHB29mo0nSsb/it1+lAdIWsNyDTgsc2ANocVFgsff2s3Mx
         iZqoC9ExH8A+G8ibVDVIQ4YdG9KYENY7TMbjJvFoFSjgC3aeJwMrzpplrcBZ/42Lb+0D
         Fn0n5FmedMBvUA7swsa/faXNi6UhfUKmQNZmcSFcLMKupcIqfgcj0qw0SNxckqKDpluS
         Iuog==
X-Forwarded-Encrypted: i=1; AJvYcCVKqR21g3hEGmmp6S8ldZoxF4oV+eq5xaH8dU3n1jYoWZGw6IIKq0OSBcZEkcqR+a5uYHRRbgi9Izx4@lists.linux.dev
X-Gm-Message-State: AOJu0YyH3jDRXimqJcZ2LLrXDDTae+LCTSIPPrwc1OBuR7rzJGALaI60
	Db/mK9H4Ugc0x3ezPZhKg9OaGihKHfNDY6NVJ+pTB6v1qhZ3ZA8nibwbMyhBM4l0pHywpswOh4r
	lmhRDA3G+LnqE86CiZICfXbn4uLS6QRjgZFHIL21qbUyBKKjt9mMtA1OXUaqCAt26Ar8OfCVJel
	OoeCLR65q56JW0lFSVyTtK9MkzyDjkxkX+FT6Obw==
X-Gm-Gg: ASbGnctQsSH1C7DLtjs+HrrWB70Jp5EUGra+OHbLtfnOnfI0VoUkdcVnPE5Zz6bi+e6
	4xrVDFJxEDmT0NxhRHUl00fW2qGVKy0uUL7C8IiKiq7FumIedBVQDdVd0uFv0IHfBqFOseJSTeJ
	acbdc=
X-Received: by 2002:a17:907:3e05:b0:ad8:87a0:62aa with SMTP id a640c23a62f3a-ae0be9b607cmr232006566b.27.1750836129551;
        Wed, 25 Jun 2025 00:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSn2LufP2ISXCKjZrnckoEKYiCIZRwiWi7ZPb/I530I2lYPGnmGD/o/IYWlMui9pp69RyQH2di6TZxvYHF0Bk=
X-Received: by 2002:a17:907:3e05:b0:ad8:87a0:62aa with SMTP id
 a640c23a62f3a-ae0be9b607cmr232003666b.27.1750836129095; Wed, 25 Jun 2025
 00:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAH4kHZ2yO3ju_iJinR9y4BDXXdWBnEP1wcv09JWMzaqp1ZP+g@mail.gmail.com>
 <CAK3XEhOs4ijnbqmv8UrNmKN4=nv6+_A7fESLibGBRR9u8rXi6w@mail.gmail.com>
 <87frifm75c.fsf@redhat.com> <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
 <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
 <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com> <100D7ECF-1292-450A-9F65-FEBA5843AB99@redhat.com>
 <7c650817-09d9-4c41-96db-62c0950d71d5@amazon.com> <0E0BB5C5-457F-49B3-A61D-98BCD10CC430@redhat.com>
 <95a3e3ca-4fba-411c-b979-4dc8ecc1f902@amazon.com> <64D33153-BCA6-4971-97A7-110504B4AAA3@redhat.com>
 <CAAH4kHZUMP6it5jwnNv6XdC9NFzj3qAi1DmCTmajTDTYm1NYZA@mail.gmail.com>
In-Reply-To: <CAAH4kHZUMP6it5jwnNv6XdC9NFzj3qAi1DmCTmajTDTYm1NYZA@mail.gmail.com>
From: Ani Sinha <anisinha@redhat.com>
Date: Wed, 25 Jun 2025 12:51:57 +0530
X-Gm-Features: AX0GCFuTbv0saWMW_dbF2MsfxxUzGM6EB8FvwFd0xLRXOYdEOnaw-W1SCtaDOhg
Message-ID: <CAK3XEhN62wQt4AgbjKr5xE0q8EV3f=ZTyunLmzdaggfN2cTdqw@mail.gmail.com>
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Alexander Graf <graf@amazon.com>, Dan Middleton <dan.middleton@linux.intel.com>, 
	Steve Rutherford <srutherford@google.com>, linux-coco@lists.linux.dev, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Joerg Roedel <jroedel@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, 
	Jon Lange <jlange@microsoft.com>, "cho@microsoft.com" <cho@microsoft.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y1Th9myJBvDsM7BKYAkqAujpuaAzF1uJrRt__GpuZJ8_1750836130
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 10:38=E2=80=AFPM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> Hey all, I've been looking into the least friction-y way to make an
> IGVM readable from disk without having to add a complex device driver
> to the VMM.
> If the FUKI application chooses to read the firmware from disk instead
> of having the binary embedded,

Ok so let me get this clear. We are talking about not embedding the
IGVM in a UKI but putting it directly on the disk right?
If this is true, I am not sure what additional problem it solves since
for azure, the issue was that they did not want to have a two stage
boot process. So they wanted to go directly to stage 2 with the IGVM
extracted from the guest disk. If I understand correctly.

 then we can insist that there exists a
> GPT partition on the same device as the ESP with IGVM partition type
> (let's say GUID C647E858-C402-4D1E-9497-95FF0A4B4465) that's the
> simplest filesystem format ever: "1FILE FS", 4 bytes of file size in
> little endian, followed by a contiguous representation of the IGVM
> file. If you want to change your firmware, create a new partition with
> this type and delete the old one. It's a simple enough file system to
> propose a DXE driver to OVMF for the FUKI application to use existing
> EFI protocols to read the file.
>
> There's the matter of reading the GPT sector and finding the IGVM
> partition, then reading the file in the single file filesystem, all
> using some method of reading the block device that has mounted the
> disk image already that the VMM would have to mess with. The block
> device access depends on VMM architecture that I couldn't really
> comment on other than folks could probably make it work for Google's
> VMM. It'd need to do some funky continuation passing style for the I/O
> threads to string together the block read requests, but it shouldn't
> be too terrible.
>
>
>
>
>
>
> On Tue, May 20, 2025 at 7:41=E2=80=AFAM Ani Sinha <anisinha@redhat.com> w=
rote:
> >
> >
> >
> > > On 19 May 2025, at 4:55=E2=80=AFPM, Alexander Graf <graf@amazon.com> =
wrote:
> > >
> > >
> > > On 19.05.25 10:37, Ani Sinha wrote:
> > >>> On 16 May 2025, at 2:55=E2=80=AFPM, Alexander Graf <graf@amazon.com=
> wrote:
> > >>>
> > >>> Hey Ani,
> > >>>
> > >>> We already presented concepts last year. If we want to preserve cre=
dibility, this year we need to show a solution that's either merged or almo=
st merged upstream and ready to use.
> > >> Hmm ok I think it will be hard to get anything merged before the dea=
dline on June 9th.
> > >
> > >
> > > It doesn't have to be merged on the 9th, but it should have a realist=
ic avenue to be merged by September 4th :).
> >
> > One blocker in this path is that IGVM support has not yet been merged i=
nto QEMU. I know Roy (now at MSFT) is working on it and I pinged him today =
in the mailing list.
> >
>
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)
>

