Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB39F217659
	for <linux-coco@lists.linux.dev>; Thu, 27 Mar 2025 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084670; cv=none; b=eJBHgffwa2lZxv1c0zUzzE40AV8BP3EEe/Vz2scTqmiz7vxRzPMOA28W+OuvuobF2L2kb2Bp5DLL1mQ0x63ZY7roMr83UYQtTk+KcQDmV0i8w+YSpVoHSF94Z2ZOW6/KT2y2kgjdSmlFb+EfHtXhK5SAo71RiB40rcAoiaJ77Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084670; c=relaxed/simple;
	bh=B7vCfx3k3GGrVgJmcqjs9B8k5ffO9HgiTB4iz81gIcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MARlKMbGtvLImOEBWtLjDHijcf8pKh3ozmhayTZ2J8dWaII9bFJukV8sO4ApIIRTlUoVMyyPNKg9X1E30GCf1LUKXBqTnp5gAA81klaRbI7Lxs8VsNqvKcNSNk9gzwjtSlCxSWgQAKdg9qX1QT6n8W/yfI26ehpsaArMrL28zJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=guqHJxrH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="guqHJxrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743084667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hi0A6scfyHr5zE+wPaQeLFGm0aUxJknUTOgLYjwIz9w=;
	b=guqHJxrHlEtB6k1VfWFiifl+cYVqwQKQg2ia/0JJC96RwO9yhk2N2uMfQreUrMHnGKJ2/E
	4QxQamfoygLfTIn8mErgOF/sfU+G1k45B2hiDvUn6zgK/LgYowkneYG2WmxRFZdrWMo8PZ
	RMmIE92q+REgEaVbEOMcJVRYN7sUPPA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-wmk99b5aMtabnGdXr3xyKw-1; Thu, 27 Mar 2025 10:11:05 -0400
X-MC-Unique: wmk99b5aMtabnGdXr3xyKw-1
X-Mimecast-MFC-AGG-ID: wmk99b5aMtabnGdXr3xyKw_1743084665
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso5715465e9.0
        for <linux-coco@lists.linux.dev>; Thu, 27 Mar 2025 07:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084665; x=1743689465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi0A6scfyHr5zE+wPaQeLFGm0aUxJknUTOgLYjwIz9w=;
        b=ebLnoYw7rLlwE6Ypgid/yf0YSnTfZe2GuTXlrB03LTecl6+utNX4wQv9lk3D7c/9Gm
         KFdpg0Rc477bacVgIMrJ43f+Eu65yHkehxtOz2hwljVUaYLtgLNCWPxZ+7jGd3kcWdO+
         gVdD6ldZtBnNg6WGxVMVJeUW4/dyjH+jrTIBeIbWYeiJlmkRpbElHRZjlUu8PXUNUm7T
         pX0KQYZba6le0RunHfKukKYFT3tG3ZOQHYRMdwudEme50/tjc/ULXNd5saTN3AbUngOO
         /xvTdxrT80yg5a13P/Xv+u4/ymFrEdy9LpSMYv1v7P6JW803J/ANchgp2ePmsgb9szws
         AfKA==
X-Forwarded-Encrypted: i=1; AJvYcCVW3wxZ25zxC/qHAKA4Huc1L4dvsjXuSidw5Q+mwmGRcKM9mX7ZvInDai4EByBvgQm0stPEH4al/4Qv@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6/0NL4PjHoIJjJPWDmE3pZ30MDiLYEXfJ51fdSrA/+xozqf8C
	p2wWAQBksDBsMjnGzLZWrfW+jtv4WqyXp042NaOa/MeP5UN2H1xbD71dh7YkJof7v1RcWmlA3tI
	mowkIvRa8HUuBEAAynXnCFOMpL3Ez6fF0zCFl2c6D/TvB68McPCpZNCwfd2o=
X-Gm-Gg: ASbGncuSFwG6F5H4skvnKfB24ejO0DlIjSU7i6XHzKbIwTuqTimDEf/+NDu7e60LDI5
	K00WK26lZsBUlgkLigU7V4Jl7POcQDor56RqNMDBmw29VXS//wsTcxjsQcIit3wdcZXA0wS2OqF
	QTNuAsZQmJ2I1AlSWil5/Yt2NBRXsxrsPvd8TNAkJ36pAMS7z9JC5Kypb0qs55rZs8T3EmvciN8
	gE4DwgyyfG79ii06CJ+nIT4b5PrQcy7m4Z7azHBIeP1drHfxkXwmdH+X8ZFRUL/PyhwPcwdBGru
	+HLMhDslAS3m10Riu7yru92yGwQEtV53oNlY0XAJCsloBTUg8QfaVAGXx9WaA0WI
X-Received: by 2002:a05:600c:1d05:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43d84f5f482mr38225335e9.2.1743084664700;
        Thu, 27 Mar 2025 07:11:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqwervicR8HJyW32dDEpFNwFDZuw43Crvb82jmCEiLUmWRbpF+tRkohYrusgDBir4muwY2dA==
X-Received: by 2002:a05:600c:1d05:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43d84f5f482mr38224505e9.2.1743084664134;
        Thu, 27 Mar 2025 07:11:04 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995a10sm19848348f8f.6.2025.03.27.07.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:11:03 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:10:58 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Dov Murik <dovmurik@linux.ibm.com>, 
	Dionna Glaze <dionnaglaze@google.com>, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 3/4] tpm: add SNP SVSM vTPM driver
Message-ID: <setj52yumlcd43q5hnsfntig5mv7uxhh6n32puahkmwg75wtlc@ft3xk3vybpwn>
References: <20250324104653.138663-1-sgarzare@redhat.com>
 <20250324104653.138663-4-sgarzare@redhat.com>
 <Z-RV7T7Bwt3Auopx@kernel.org>
 <x3nkctmpbwkldm5aawfpqrw3b5lej5kxuxam7gb2w6nhgzy7kr@gd3mfnigyg6q>
 <Z-U8UxEdt9Jit9GA@kernel.org>
 <Z-U9KxQYA6vj1DZT@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z-U9KxQYA6vj1DZT@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uZEzMGMNGA13ELzDqnasy8SGtcFEWUXdsjLCB8BSUNo_1743084665
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Mar 27, 2025 at 01:57:31PM +0200, Jarkko Sakkinen wrote:
>On Thu, Mar 27, 2025 at 01:53:59PM +0200, Jarkko Sakkinen wrote:
>> On Thu, Mar 27, 2025 at 11:03:07AM +0100, Stefano Garzarella wrote:
>> > On Wed, Mar 26, 2025 at 09:30:53PM +0200, Jarkko Sakkinen wrote:
>> > > On Mon, Mar 24, 2025 at 11:46:48AM +0100, Stefano Garzarella wrote:

[...]

>> > > > +
>> > > > +static struct tpm_class_ops tpm_chip_ops = {
>> > > > +	.flags = TPM_OPS_AUTO_STARTUP,
>> > > > +	.recv = tpm_svsm_recv,
>> > > > +	.send = tpm_svsm_send,
>> > > > +	.cancel = tpm_svsm_cancel,
>> > > > +	.status = tpm_svsm_status,
>> > > > +	.req_complete_mask = 0,
>> > > > +	.req_complete_val = 0,
>> > > > +	.req_canceled = tpm_svsm_req_canceled,
>> > >
>> > > If this was bundled with the patch set, this would short a lot:
>> > >
>> > > https://lore.kernel.org/linux-integrity/20250326161838.123606-1-jarkko@kernel.org/T/#u
>> > >
>> > > So maybe for v5? Including this patch does not take send_recv()
>> > > out of consideration, it is just smart thing to do in all cases.
>> > >
>> > > It would be probably easiest to roll out my patch together with
>> > > rest of the patch set.
>> >
>> > Yeah, I agree. I'll include it in this series and adapt this patch on top of
>> > it.
>>
>> Yeah, and you could simplify to goal in the other patch set: it's about
>> avoiding double-copy of a buffer.

Yep, agree!

>>
>> It's a totally legit argument that we can measure. So in the end this
>> will help out landing that too because it takes away the extra cruft
>> and streamlines the goal.
>
>... IMHO there is this unwritten law for upstreaming kernel features
>that goes something like "further the goals are from white papers,
>closer they are to mainline" ;-)

:-D I'll make a note of it!

Thanks,
Stefano

