Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6911B0433
	for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841629; cv=none; b=TfLxB5szuhEZm4r3Ns0vmWR6uqRsb8MvNkljDlmykaJ8XKC3FcimGUgl+8Lwv5tFp82ugZDuHqLJ01reaR7lVZXgq+I8XolQSbUTvcudjWMU+OodTERuxLUJjxVb+qKI2HltdD8/9b+4U3S3PAtEVbPYcCTecmeRv/UFFWfxSs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841629; c=relaxed/simple;
	bh=JoIVFUb4lqiuj92k/cmstv6/5QcjCYKPkCz58/ijs6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaMnbeJg0ZqURqgWsk4RbH2MV+GiLG61b6tJ9fyz+c2H9hbsOOxa13SYiC2EjC4XCmsnF1IUoL0mEYr0R7NrOCslkuIjYWbwCQyFJBzj5chByAE8pjlIWI6qA1GrtDpeaW7IOYVt6rCPKPxOqkZMveFmz3HHoa1FeQNHPOUDpmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=h8omIHLv; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="h8omIHLv"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4676aad83d3so17574941cf.3
        for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 06:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1733841627; x=1734446427; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=taRWKmra+p/mbT7xIVp84lXpkBlUdolqun+ITMGMMTc=;
        b=h8omIHLvzOoEb4KrqtUgxSnvV6pI+HLodtzXM3M7IGyR27URr1hujqHcjryONnDJ+6
         nsBPam3+Lrvh2dr1ooAad+A1MXXR0UFUpWgapj4lm8T6yHtzO/ibCQYNRGeK/1MZjqyh
         9UoleGPBfawmCZ9vz/Va12dwk9mXVIvhsChvkxsigdlc6K3Qr9S6e6cMffFPl2QX6/qN
         NOvOPnGDmk6eeS3vUo+Wb2CBB3CTxcfvAngiSTXShe6ciFwVALE1FWdekZauFKw8LLHO
         HVhcYYhKRQ8dTTTqahPhHe2IEujnajWESKw5rV9yzXFeIMR6TmKgg6KILIIaQjmL/UGq
         7byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841627; x=1734446427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taRWKmra+p/mbT7xIVp84lXpkBlUdolqun+ITMGMMTc=;
        b=mcqdBPe5rQrqFdO30XtByv6AbIgkrCm9E+WcpUuqILzgwnNwvUgovOjWxJy2aqhZpl
         Cyysu8kWiEY6UEs+1x0qpoz4G1RB0MLGzWX8dODiDD8yKdbhVg7TneOnDyzlUXQqy42/
         mQ1nBcMIoGdp+R6u04f39m6Dx89Hc8KoxpPRQbkloVLS/aQQ46TCNQh7hnZwi0eop96g
         onjDoNNgN6ErtGriCLzbvtuoWbR25HSY4/+iAfuyAyK0zV6ERdqE2qMWk2ON50w11EWt
         z48uH972V7YTjSGerolw9eR0jvSUC1Rc2rAEByE+rTBJcnhpnrH7V29dBu06+Rs11mnT
         FCBw==
X-Gm-Message-State: AOJu0Yxvz+cI1WaezvqdIEnfHetpbltU2syo2bUoqhZdH/2zAS0zx4sW
	EdqTqCDS344HovqDzt1G5GpV/CTFX6P0HAgUDzhofpxceEMYUrvg0zmIcgwtElI=
X-Gm-Gg: ASbGncuVDtfKcHiPZgNv0cBfyz4G87yfi4IDjIXbkA6tUfvA/nfKPzdO/UPgqfpKXhO
	yv5t+L+YeyxWGldTcI3l2AJ39596g75AugBVzu/QlH8fJvJKTLw/aDw0+ciGmAR0lIiYHOb7NQa
	CfI4YsxX9dZNW4KSoGYUnuXZS2hoC5dgjzWsAmUH+ldIPWAYP3h1TlpMC9VhGwxJAD2AcYwf+KR
	YWyHLcb1c00mVL2wKZq0dV5CMsvxAQsdah1//G2hvEAyPgPN0XT9muMUjhjrq0utl1XvXR4VRdN
	qCokWBvuEgZAK/z1nsq9zQPxqoc=
X-Google-Smtp-Source: AGHT+IFkLP9MbL2WiKPj9SIjMVoZeZhAPlq2JNQ88ChV6UcoHjYV2Ck4cRh8p9LeNsUH6YMFLbLSZg==
X-Received: by 2002:a05:622a:98c:b0:467:4c21:e396 with SMTP id d75a77b69052e-4677205d427mr91007131cf.55.1733841626900;
        Tue, 10 Dec 2024 06:40:26 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm26750421cf.30.2024.12.10.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:40:26 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tL1PV-0000000A2bC-3DVn;
	Tue, 10 Dec 2024 10:40:25 -0400
Date: Tue, 10 Dec 2024 10:40:25 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-integrity@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	x86@kernel.org, Joerg Roedel <jroedel@suse.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
Message-ID: <20241210144025.GG1888283@ziepe.ca>
References: <20241210143423.101774-1-sgarzare@redhat.com>
 <20241210143423.101774-4-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210143423.101774-4-sgarzare@redhat.com>

On Tue, Dec 10, 2024 at 03:34:23PM +0100, Stefano Garzarella wrote:

> +		if (platform_device_add_data(&tpm_device, &pops, sizeof(pops)))
> +			return -ENODEV;
> +		if (platform_device_register(&tpm_device))
> +			return -ENODEV;

This seems like an old fashioned way to instantiate a device. Why do
this? Just put the TPM driver here and forget about pops? Simple tpm
drivers are not very complex.

Jason
