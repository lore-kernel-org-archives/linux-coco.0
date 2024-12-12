Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D6123D41A
	for <linux-coco@lists.linux.dev>; Thu, 12 Dec 2024 16:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019946; cv=none; b=tB1BDvn7Jpj0BCGZZNtP5TJdRBuvR+TouD5eTUb3pELW3ST1OdCKqTBgztmdRvbrVv1iLpFphcSPqfCfe3QkoJd6CqJxOPOZorBnEmYyLaczm3im7PZJFRfO2FhBbQ+O6ZmbdQFZI2ClcM7L0jkMzQ709xAqc0BS+tgUCTdSlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019946; c=relaxed/simple;
	bh=gQeMN/hzMse2RdZ8TAIK8FaDfdRqMn7t4SI9J9weUu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Sa4fMD3+Vne+t2uREnf+34BvGszaVCEkVI607+d0a4IJnaPI0UFtSYPgVqRS14Orxt/N87IevEQd9fHY4AjYm/rIPQXtqj6gMl3J+6WTffyXcLGpU/mxKgvhPQ6nnXAMM7ioAzOtfhT5EHmo2eQbm5HXRy4bws8ru3O1ZTX5iRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IKwi0mht; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IKwi0mht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734019943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3yKeZBqhENcBvrI8hOmZpd1UmWO6hrsqES60Q4cdw4=;
	b=IKwi0mhtku1uMz7UAhEUuiSF3muYfsgmNa6y3XaaHkSbK/pizKnAuxyPlnyytlahrM2UJs
	DHbEfueBETjsugj0uIya4XhCpmPgeh9RLbdpl1u5IOmi4uf9JaaeRMZKTh2cPyc79aESRa
	dZOL2X/Q0y6krcISRCCWGA4NKv+4S4M=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-SknZQvYPMLSP1ZVRjZttyA-1; Thu, 12 Dec 2024 11:12:20 -0500
X-MC-Unique: SknZQvYPMLSP1ZVRjZttyA-1
X-Mimecast-MFC-AGG-ID: SknZQvYPMLSP1ZVRjZttyA
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f2515eb3so89629485a.0
        for <linux-coco@lists.linux.dev>; Thu, 12 Dec 2024 08:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019940; x=1734624740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3yKeZBqhENcBvrI8hOmZpd1UmWO6hrsqES60Q4cdw4=;
        b=aNz65/32NYBX3dq5DmdWRsRYj4cmUx3F5Zkqc1qH+qZw154T0P7/LosM7kLme+hYyo
         ZvBYtGkwCLFxmxbKZ6IxsQBmOMMQByOsJu4Itczb4Ao5rGK1xJ0jkaVpndy0nfFaT4cv
         1JIUGm28snDplp4DaBnTH43lYrVpUqHIi68dLqTjjo/nqPQ6MkI/PsJ4ZtDYqY3pVGE7
         oGZpw2bE1Jl6TojDoaTqgaEM13MhuYh8Pe4plBfmCZlM7nkc3S3OER107RAeTx9jkPRn
         UKiWT1pMO9ZCFiNN0RE4+v4keMj4DYalAFh92AODp68106C+6d95Ivv+RRn85TXHnyF7
         WGRw==
X-Forwarded-Encrypted: i=1; AJvYcCVO+SFXt/DKr4pUgR+SG1zodooHfQ2VZ/iMjn1Cw+iyv9YzjAK8pGvf78JlB22VJh0HAIcHPMmUNtji@lists.linux.dev
X-Gm-Message-State: AOJu0YyMAiv8PO8v2X5tAMhlZJsxcsEZFPIf+zfiv8lA/a4A8knUvleB
	xHwN4JvPpgrZ9oZJjgwcN0ZKk6NKMhzdrzkiQx0NajXjw9H9HJulHnv9XYleq9parXz/jrPzB47
	LqvoFSxBG7ikcHnQ+/CXDa03Vvv4bEikBKKFey2dRc8uyZZDMiXQCNKU/AEM=
X-Gm-Gg: ASbGncuLJ+GJKxg261cen5rqGb75LjM2IQDtE1CimQsyEIBL+136SGyLFoosiO0tKy9
	NSWAgdRXfJL56HB4cd8p5RAgvGZBOAwfXsIpxB8Sv0ZAgRc9onMDKroMZi3MZRrZ8KwpLrUzXEI
	kX8vmeMtvts+H/Q8GEh5vx6msY6x4CN4Bh1iQeV6m/wliAKQFkYrlEL7PITTSvqhMlXWXqwhWSO
	dAyMwjqogP+6OM5FMkyjqPkIsEx9A4JyPXLmU3LCngG2g1Mh1ttJZZkmLtxziXd76W29Wo+kePI
	qUda8JeSjoFECrL1OCBNkYjImAi10xhv
X-Received: by 2002:a05:620a:2402:b0:7a9:bd5b:eb61 with SMTP id af79cd13be357-7b6f893e1e5mr122009485a.27.1734019939735;
        Thu, 12 Dec 2024 08:12:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYVaqJoVFY+tmY6ANONIZ3h5S86lA/dyXyVvVbMqYIqUn3UoSvlQ53qJQSvuWrq2qJ25Yn0g==
X-Received: by 2002:a05:620a:2402:b0:7a9:bd5b:eb61 with SMTP id af79cd13be357-7b6f893e1e5mr122006285a.27.1734019939299;
        Thu, 12 Dec 2024 08:12:19 -0800 (PST)
Received: from sgarzare-redhat (host-87-12-185-21.business.telecomitalia.it. [87.12.185.21])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6d990baf2sm365110085a.113.2024.12.12.08.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:12:18 -0800 (PST)
Date: Thu, 12 Dec 2024 17:12:05 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-integrity@vger.kernel.org, x86@kernel.org, 
	Joerg Roedel <jroedel@suse.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dov Murik <dovmurik@linux.ibm.com>, 
	Oliver Steffen <osteffen@redhat.com>
Subject: Re: [PATCH 1/3] tpm: add generic platform device
Message-ID: <qjfj2dkue6r54di4hsrsguzbaxasvpyvv2llcnruhp75s6izc3@7lgj7zmxzsly>
References: <20241210143423.101774-1-sgarzare@redhat.com>
 <20241210143423.101774-2-sgarzare@redhat.com>
 <zzi3fvbo2rnb2d76soseuekwaqe22ifnrhhjplqhvw6x26lbb4@nmcqylrenzyj>
 <b92113a11f121dc4d485b5ba522c8c8c0781d1be.camel@HansenPartnership.com>
 <cnq6nzhvrsas6ud7t4woybktpesepm7a3sq5sd5yldq4hr5kyl@ezm4xi3o7eax>
 <d84a9a960e419cf8cbfd086e8210b6c4a112d04f.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d84a9a960e419cf8cbfd086e8210b6c4a112d04f.camel@HansenPartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jij0Kb5i_JdZ1T8lXkIt5F0bYkOeKdZnwKRrJWnXGCU_1734019940
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Dec 12, 2024 at 10:41:40AM -0500, James Bottomley wrote:
>On Thu, 2024-12-12 at 16:30 +0100, Stefano Garzarella wrote:
>> On Thu, Dec 12, 2024 at 09:35:46AM -0500, James Bottomley wrote:
>> > On Thu, 2024-12-12 at 10:51 +0100, Stefano Garzarella wrote:
>> > > On Tue, Dec 10, 2024 at 03:34:21PM +0100, Stefano Garzarella
>> > > wrote:
>> > [...]
>> > > > +static int tpm_platform_recv(struct tpm_chip *chip, u8 *buf,
>> > > > size_t len)
>> > > > +{
>> > > > +       struct tpm_resp *resp = (struct tpm_resp *)buffer;
>> > > > +
>> > > > +       if (resp->size < 0)
>> > > > +               return resp->size;
>> > >
>> > > While reviewing Oliver's work for the driver in edk2[1], I
>> > > noticed that there wasn't this check and asked to add it, but
>> > > talking to him and looking in the code/spec, we realized that
>> > > it's strange that tpm_resp.size field is signed.
>> > >
>> > >  From SVSM spec it looks like it can't be negative:
>> > >
>> > >      Table 17: TPM_SEND_COMMAND Response Structure
>> > >
>> > >      Byte     Size        Meaning
>> > >      Offset   (Bytes)
>> > >      0x000    4           Response size (in bytes)
>> > >      0x004    Variable    Variable Response
>> > >
>> > > And also Coconut SVSM remap it to the `responseSize` of the TCG
>> > > TPM implementation which is unsigned:
>> > >
>> > >      LIB_EXPORT void _plat__RunCommand(
>> > >          uint32_t        requestSize,   // IN: command buffer size
>> > >          unsigned char*  request,       // IN: command buffer
>> > >          uint32_t*       responseSize,  // IN/OUT: response buffer
>> > > size
>> > >          unsigned char** response       // IN/OUT: response buffer
>> > >      )
>> > >
>> > > @James, @Claudio, @Tom, should we use u32 for tpm_resp.size?
>> >
>> > The original idea was to allow the protocol to return an error
>> > (like out of memory or something) before the command ever got to
>> > the TPM rather than having to wrap it up in a TPM error.  However,
>> > that's done in the actual return from the SVSM call, which the
>> > sendrecv routine checks, so I agree this can be removed and a u32
>> > done for the length.
>>
>> Thanks for the details!
>> I'll fix it in v2 and put a comment also in the edk2 PR.
>>
>> > Dov did recommend we should check the returned length against the
>> > maximum allowable:
>> >
>> > https://lore.kernel.org/linux-coco/f7d0bd07-ba1b-894e-5e39-15fb1817bc8b@linux.ibm.com/
>>
>> I added in this version the check he suggested:
>>
>>         if (resp->size > TPM_PLATFORM_MAX_BUFFER - sizeof(*resp))
>>                 return -EINVAL;  // Invalid response from the
>> platform TPM
>>
>> Were you referring to that?
>
>Yes, the theory being that we're required to provide a buffer of this
>length for the response, but if someone can inject a bogus response
>they could induce us to copy beyond the end of the buffer we provided.

I see, but we alread check that `len < resp->size` in
tpm_platform_recv(), so on second glance, for the current
implementation, maybe it's a duplicate check.

This because in tpm_platform_send() we return an error if `len >
TPM_PLATFORM_MAX_BUFFER - sizeof(*req)` and here, in
tpm_platform_recv(), we already return an error if `len < resp->size`.

IIUC buf/len are the same for send() and recv(), so the `resp->size >
TPM_PLATFORM_MAX_BUFFER - sizeof(*resp)` case would already be covered,
right?

Anyway this code will change a bit in v2 if we implement the send_recv() 
op for tpm_class_ops, so I'll be sure to take care of this case.

Thanks,
Stefano

