Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A6D22332C
	for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583020; cv=none; b=WPxChDuDYaxq54jxNs8G0y0Vw3crS6bmI0OTyAxam+FfRVL9/pW/z65mw/XU0HYYy2VJFg4Uz5dA9Du4DYnkRXlCXndEjMcLJE1WdLdFAXNRN5cCCEFq+f1JIhgv+C4a5m5ijeDTAZER00L/ENwHkE5W7iAYxtc2tVcoq7q/G38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583020; c=relaxed/simple;
	bh=hPlQqnEfgZ98qMM/OgrgYPS2ohmDkkoL0MWzob01lJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=t8BpRJcd0EbemaZ6hrprE3a6keycMosQsupmwWq/HxQ92XnVUy+SPGHaCH+ytJBxukeva6FlKTu4su2sXfLeNdLn1GXD147I782AvV1QkLWbLcrqKdCq+RFVTnjuToUGyormrEtK+zFxpR+blxHssm84zLwAXxrAPIoVuPkNiGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TR26oYG/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TR26oYG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740583017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y6O3H0bKwSgz8ac6NG6weWjL85qpaidZjw0jrlrtCgQ=;
	b=TR26oYG/SNkRWW7tFjjfPgnkrpfO6ILpL7UurotB5g0jmC+loPbOz5L9l0rmxmWQhqSdk0
	vdZwgYUUuJJuPvNAZgHRDS3eKB5ZOZMA/ikGRtBZiDl/zfdxj6pQPw3hHfSeSF/cb7Tc+T
	Ww8kjFbph7XI87sWyEclQkVkrsQFCY8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-gCMi56N7N8Kj-GA9TOA-Ww-1; Wed, 26 Feb 2025 10:16:55 -0500
X-MC-Unique: gCMi56N7N8Kj-GA9TOA-Ww-1
X-Mimecast-MFC-AGG-ID: gCMi56N7N8Kj-GA9TOA-Ww_1740583014
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-abb7e837a7aso668393766b.3
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 07:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583014; x=1741187814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6O3H0bKwSgz8ac6NG6weWjL85qpaidZjw0jrlrtCgQ=;
        b=SsDNgNP3mDMLmu8xNoB/htUy5/g3QdJ01lcnAaUjGrDgOARz21QLKkRuDzHYUaPr9D
         4+rerqgdz7+9r9GNbKyXsW/3eDNV4Aqf1pZFK1uNAPHsIZnLayfMwX9P2rcsyG8HcXb9
         KUyLzkuYbJu2HN76ToniavY8BtZ7dmb1GbbhVcQCmJAERlNPK04LcmEQmt1p7uZI8l1R
         NEpks3670VIvt6LwroKwq2FH8cJGxjBNbEW6qPy9taAwdJl0NOsqFeVRQegiYYyQ+A36
         hiE47qfpFbTo7i9PpYCSvRRA/CkCpVezACjIe/Wppez2ANpFDq8hoQw1GsAeBPgAh8im
         WhJA==
X-Gm-Message-State: AOJu0YyjGW0u12oS4s8llCL/Gu4o/Q2lu9G2WMn+9ObXEUW0XiJsZAl2
	olKSWspQih9IyS3QVaI6jhEQk7yAEGFvYLKnOWg28Pw0ZDw9Xy1L4H/fRPt1uV1fkTQWea9nEG4
	QG3QYXWtzKDgwP59iiAcidY4+C0sQFIKKWJL02gh7GYE0uH0CqVBz01UpMhRIU3RwBXA=
X-Gm-Gg: ASbGncu8bg9f6HoRACKZbgoVORrees2KUUH/gYZNA3ahP5n6aWVn3D0ibfLv76Wy3Oh
	04Wz9jCBfvegDHOY5I/B8Qz71kGiAZhAmaY5Q+WVkZYKu6jg75phvpRX1hjOlBj1XomDNEzBOJD
	4RgwpbUKpiO+JD7yaQOEGo1ZWUqFx9gNuO7TLbnceqT7llBwqki/Xl89VDfWoDT66CIAjABdHVZ
	1XcKI7EmqIyWR0nOM3LVz9E/3xJo6RoY9SQavQ18L867rqtx9AJ2sWZl19uS+vGto662GS8W5e6
	7L2Mx+EoeBJUrUKj
X-Received: by 2002:a17:906:7cd8:b0:ab7:b5d9:525a with SMTP id a640c23a62f3a-abc09c1a653mr1903737466b.37.1740583013625;
        Wed, 26 Feb 2025 07:16:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsh1EaBpXd7OmqHZw38Ij08xBL5oY1iYC2WScIrgEFN0uFpeliEgCTxXIyQ/RX+qJtWtBw5A==
X-Received: by 2002:a17:906:7cd8:b0:ab7:b5d9:525a with SMTP id a640c23a62f3a-abc09c1a653mr1903732166b.37.1740583012942;
        Wed, 26 Feb 2025 07:16:52 -0800 (PST)
Received: from sgarzare-redhat ([5.77.88.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20b81a0sm339398666b.180.2025.02.26.07.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 07:16:52 -0800 (PST)
Date: Wed, 26 Feb 2025 16:16:47 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Subject: Re: [svsm-devel] Using a linux bus for SVSM devices
Message-ID: <CAGxU2F7LacCGbuL3HemvfOAD9v9i_GCbdM8Y4bs+xT=+JBz1ug@mail.gmail.com>
References: <38fdf6373fe5f500115d09bcad391e14137b75b8.camel@HansenPartnership.com>
 <CAGxU2F5N7MrLU_Wsr0D1nBS_C=ojjm-NUmf5_a00j6+jiuDtJw@mail.gmail.com>
 <3cbef80a611a8ce6b9584981777810ec054de7f8.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3cbef80a611a8ce6b9584981777810ec054de7f8.camel@HansenPartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NaL9QEVmG1J8p3tv1M3645ynNvx2F9SvDhrwku46geA_1740583014
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 26 Feb 2025 at 15:34, James Bottomley <James.Bottomley@hansenpartnership.com> wrote:
>
> On Wed, 2025-02-26 at 15:04 +0100, Stefano Garzarella wrote:
> [...]
> > IIUC the SVSM vTPM driver will be the first one using the new bus.
> > Since I have the new version almost ready (need to finish writing
> > better commit descriptions), do you think I should post it in any
> > case as RFC, or better to wait to include also the SVSM bus?
> >
> > The current version is here [1] but it still uses platform devices,
> > even though I removed one as requested during the review of the
> > previous version.
>
> So on this, yes, it's always wise to post early and often, particularly
> where there's a discussion about where the code is going.  Seeing
> updated code helps people frame arguments.

Got it ;-)

>
> Just on the platform device: Greg seems to be going on an anti-platform
> device bender at the moment
>
> https://lore.kernel.org/linux-usb/2025021023-sandstorm-precise-9f5d@gregkh/
>
> So you may need to humour him and use his faux bus instead.

I see, thanks for sharing!

Currently, I have
- module_platform_driver_probe(tpm_svsm_driver, tpm_svsm_probe) in
  drivers/char/tpm/tpm_svsm.c since they asked to keep tpm drivers in
  drivers/char/tpm
- platform_device_register(&tpm_svsm_device) in arch/x86/coco/sev/core.c
  to load it

I'll check if I can use the faux bus in this case.

>
> > If no one is working on the new SVSM bus or planning to (don't want
> > to step on anyone's toes), I can try adding something to that branch
> > and send an RFC here.
>
> I was going to do an RFC in my copious free time, but I've no objection
> at all to someone else doing it...

If I can do something (probably next week), I'll let you know!

Thanks,
Stefano

