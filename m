Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7542022AE6B
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018866; cv=none; b=gvMQ5e7ds+fLpeQ0RsK9SMEiOX6EBxsDEwr7AujUzXa2oxHXX3ed0niDyceG4QTH8zJRQ1AGetMKrfCk1LcxpJ/X92GmAPsB6QhCaO2FPaneQZkv6hzew1XxGZcj7CLqEVACin1+YVrQ3PqelB/FVKOdKKWf2S6sPMLXJBU0hFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018866; c=relaxed/simple;
	bh=402wUqZufsOsa3QE1ks4oJmtnZKVbPJ2tFfnJxLD8J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SroWvz33UMDffnjp9lDdFtLc4TKHerNi8EFhyu1gFRjEsq9fX253f1yQOHWv6bVoxQLLuzIDBgCTmBRk3iCRiQg/tDBI5t+KLNGMxEkIzjG4D+RcTVzvdKlqcsKUNGFo0IRay+L8l7vnJULpkBbyLprRq3+sOZ4dBgBPZnOzVAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XJGdciWJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XJGdciWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741018863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kwE0kZnHaMHXEDQxouFsy+p0EMd7yWpEqSqhQfyrJvg=;
	b=XJGdciWJKUoAlUY+cuFN4P4KOycUsEMmmaxBXyXl+czsV0DulQMKy3uULAbSdtJXlt1CpF
	c8yhtBgo+y+xtmxrh3KwNL6D1Sag2nTEHOa8CGKqaHvoW7ztlNDtU4//ucy8h2YAuRjvf+
	GMDkb0Jtk+0knyK5yGAhI6Oil3kezrg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-j18hCyYHMb2QAM7Rpur9vA-1; Mon, 03 Mar 2025 11:20:51 -0500
X-MC-Unique: j18hCyYHMb2QAM7Rpur9vA-1
X-Mimecast-MFC-AGG-ID: j18hCyYHMb2QAM7Rpur9vA_1741018851
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390f7db84faso1740065f8f.2
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 08:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741018850; x=1741623650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwE0kZnHaMHXEDQxouFsy+p0EMd7yWpEqSqhQfyrJvg=;
        b=ZxxgubAJ0cos15T3l7GuqoKZwlACbaKTrfgidHmdlvj7zKtbdrTaU5X1SrYs48CQDn
         sAzxgGNPImgR063U7VYzPKWz33i2ZhK539lJ8Z3IWBrZSlcl9k8uwTNLv5mPOsgPoh+e
         KYfaXXwtkgN7VboTbgY2Q47czkl0qP6Q8QkLxyd6RKZxFUitlLAx2xpVrXdJiJ5qYJF6
         e0qED8ySDsDRi5ihoOftSLCup7Q39gy2N2GtpVEtLFRjTYk3Uf8fIshFGgx+RAAwWu5R
         KD6+hZRnK1GkR+e5Gg879cspRKraDkcs7ZL1N4oczLGgaFFP0mi+o6nwAyrAQQqa0s5a
         bMdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlrQ3YMg+16ie2kJ0lxAjWXQvIwJZ0hZ4oDCh5EIMVczRqt3RQjwDlmIFDnEsaQfdI9vV/clzjnhJJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzE+nNPO8t/H5SDeUDGwS87wGnHYnAnG9ibj9x1OX18FeoFg5Zu
	P7xOWkW7jkSRlZUFkHuVwHUG1/VdRJ34jElLQsoEwXEXo2lf9XfcAQC2aUzSVQ5xiVW0OM1saQX
	cCMOPASXd9Bld3UKr8KpZxXMV7wNO020rFEc4daFtKj2cW8fKjHVB/7Prl+8=
X-Gm-Gg: ASbGncuLnOVj6TgYDcm9NNXvqTVjRwrzbicd9fJz6lPSvwnruFfND8jQT8NVdeOWAeh
	U2XddbuqczTSBj/dDXeibs+jmi9IRYa+uCI3EFyfkaQgT/t/ZaM1JHMshOCsVXcoAUqjJJOHHvi
	JJrNo/iG2aAlVF4zL2MmuuOP6q/lHQTvAX2WAcw0H/Do05W7YOOhvgTF3KxEEV3JcQ/nLnD5Yzq
	PR4c3cGMvhtRWgZXAoqBBvghg1dTdxSd91UsR+sRl//Ewsz9BU39+X10rMh2UlifqcUfl8ZaSDN
	F5fbL53O8n4e2Uoegb8QtCYTyiqyKIATnjCq7CwAeqfusgvOcxTQTy5t+AMs8+DV
X-Received: by 2002:a05:6000:4021:b0:391:a74:d7d7 with SMTP id ffacd0b85a97d-3910a74d8e6mr4864371f8f.8.1741018850662;
        Mon, 03 Mar 2025 08:20:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJkGVDdAKM9Y8PmJ0U+nghUhjVOpFdN8aFO96nlwoN01M7SmNc/xMw3vIU8qZIs/W7CGHyJA==
X-Received: by 2002:a05:6000:4021:b0:391:a74:d7d7 with SMTP id ffacd0b85a97d-3910a74d8e6mr4864327f8f.8.1741018850234;
        Mon, 03 Mar 2025 08:20:50 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47960b6sm15276831f8f.17.2025.03.03.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 08:20:49 -0800 (PST)
Date: Mon, 3 Mar 2025 17:20:44 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 0/6] Enlightened vTPM support for SVSM on SEV-SNP
Message-ID: <w4zyf33sixofbqmz4mxyobihicrywjwvjbpmiipcqrlejjfwjd@t7ok7sjni3cn>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250301003009.GP5011@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250301003009.GP5011@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8M5wQjZS_NnZzUqCE70sgIb2Byd_PPCW-QTcfviZs4Q_1741018851
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Feb 28, 2025 at 08:30:09PM -0400, Jason Gunthorpe wrote:
>On Fri, Feb 28, 2025 at 06:07:14PM +0100, Stefano Garzarella wrote:
>> I put RFC back in because we haven't yet decided if this is the best
>> approach to support SVSM vTPM, but I really like to receive feedbacks
>> especially from the maintainer/reviewers of the TPM subsystem, to see if
>> this approach is acceptable.
>
>I didn't look in high detail, but the overall shape is what I was
>thinking about in our previous conversations. Very little TPM code is
>under arch/, we have a nice simplifying helper in the core code, and
>you have a tidy platform device to tie it all together.

Thank you so much for taking a look and confirming that I understood 
your suggestions correctly!

Stefano

