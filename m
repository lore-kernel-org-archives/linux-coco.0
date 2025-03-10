Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D01122B59D
	for <linux-coco@lists.linux.dev>; Mon, 10 Mar 2025 13:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741615195; cv=none; b=LxzPxGXF0LytTO+w8Rz+xDaPQGZo0SLFM1ZvtitGLxQ9e59VrVx6MclIxPxpIXdyTRdsh3HsRw3UxIQCBjy8u6FMV4p+py3sj3ioXFTxnEurTz1BHKW/fQ8QDgfI9/O3m18jGarMMdPxmsxWzWH5CgCxInvp1r4x3kfo5Zcb3QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741615195; c=relaxed/simple;
	bh=5yRa8msLShePncZ4iDaj+ETPUsYjrQ57wsSamBBpqFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=m4KGcKcohwDsJSxl0BGqXuLLn59ZrC059iiY6LbrzamHBrbDKaOE1WRuA+39p1BUGfb50N1Ye6bSnRNlIsEuvDiVbHdlrommvBxSs1cISeX7T1L/cAj4Fu2rgHw80O3wjMXYmsB3M9FlsOvbPidFqDsg3M1HTu2rXpYXWCbVVDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CGfbJCB3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CGfbJCB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741615193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ifLyZAwaMIQnJH8LV9Yf25LDs5jy6kdU3M/pInj3w4g=;
	b=CGfbJCB3h74hfYh9wvbwHoAqsZ4D5zYvleITVtJeT+Fl1BKy0jj/NMtsYdyeoO20obKDqZ
	JKhhgZrZzqa60YeqCuqhrOCPox2zJdobkp+HLaw5ewmWT8XvHqfWUFQ+dIVCyWoK8DqSqh
	kIvccIwUKI/qIJP0j1vsD3eCszoFazk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-2Vw0FBDLNiyv4JAt4jxdcg-1; Mon, 10 Mar 2025 09:59:51 -0400
X-MC-Unique: 2Vw0FBDLNiyv4JAt4jxdcg-1
X-Mimecast-MFC-AGG-ID: 2Vw0FBDLNiyv4JAt4jxdcg_1741615191
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4394c747c72so17532755e9.1
        for <linux-coco@lists.linux.dev>; Mon, 10 Mar 2025 06:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741615191; x=1742219991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifLyZAwaMIQnJH8LV9Yf25LDs5jy6kdU3M/pInj3w4g=;
        b=wWWw/sMNs+jqKt3pPbpVRKChsH82rlQf3ruC6+Ft7nJb/lqPosoqJIYGQYY0c8aeZN
         S7+lxrwdqXLrD2EsmEUY/1yhYTgZFZ6duXaaYRMWHK+8+DW+2+Vnon/H/V9s2ANN+eiD
         XrJehKY+5KSTlbvWzLwesUY4rcMmc9ozyfUWJKu8urwPyWEDFFie8wrIB35YGM4fPG0r
         /MGRgUQ+HRv0c8Ic1QGrO0NCb46rl3DNOvr+urfjA2HxLdXSirKmHKtYLwOHO+nGHzU6
         Q3bBcEe+k1klQTa91AVLfVqrkWEnkV9QGTfleE6bb+A3e+yoeKDGPItuLaOmf+4XFjfn
         CnMg==
X-Forwarded-Encrypted: i=1; AJvYcCX4RufPHAJufXvTyGkXChbzqlTfreDMTOoAf9ebmYttUSeUnouN2neOsdpR206U6Nxqvxmnef/URaTp@lists.linux.dev
X-Gm-Message-State: AOJu0YyxjUS6BAVxa7U5pp25p6Jw2aMQIM1BDVkxq0b4GcdY1c3O6AAJ
	Z3P3pbh7isHsnvkCH1NMNOO+5DoIpM13PnZvuQHduwQ5HI6i/Z/BOsWmJiDQlXa6Itu2kW3HxpF
	yDeCavQZAqmRJqV9HShfWeiSlFugzxBwi3Bt7PQqePlQtTWII9V/YAIZuPWE=
X-Gm-Gg: ASbGnct/EK6vhDPCG9cENYWOov3dtSPOfajnlJJ3zdNffpHRXOBbjTxQWuSByYezCwK
	7hQcz+qLaOq6sCnJ0bDB3gSN+9AjV32/oid9sVWRko7fVj35x6f8krN2dcUUGm+dBe14O/1SKj5
	vQvdUaY/Vxsqwjqzk6rbMGWkGyApxpTiOiZS2t+A96+mWull1GWWQrRRw4Awxy/6WeTusKjTRbK
	mZNQuVbefCpU+lGlrzSO5BatBNXLSHe4scn0+04fAZ3n91wpuxbSHRJsVLXThhWeIy0RyiaKJv0
	D/fGJXxGwHCCKPGLPupEpijMHC6skOigbDssH6I/sGXSwHnr0iMdc7WdygjR3ajw
X-Received: by 2002:a05:600c:19cd:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-43cf1b81b78mr36929315e9.30.1741615190719;
        Mon, 10 Mar 2025 06:59:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFmVHuNChMNNNrFWHjGJdn1345A9IsanbdgH+oWygKlCfwy44eSx0LLGJRthRLUF/igUx+qA==
X-Received: by 2002:a05:600c:19cd:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-43cf1b81b78mr36928725e9.30.1741615190121;
        Mon, 10 Mar 2025 06:59:50 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceeb5995esm64570735e9.16.2025.03.10.06.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:59:49 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:59:44 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 2/6] x86/sev: add SVSM vTPM probe/send_command
 functions
Message-ID: <6yzzspawrp6lg3m242bcdl5egpdvt6je2kc3cuznnnze7iypc7@4uaonepi7myq>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-3-sgarzare@redhat.com>
 <20250310113006.GFZ87NPu-LgFVVtsEG@fat_crate.local>
 <mjftygohmhgs6daqvgkh2jbfuqjquchcaovcjtnzyhilnt5ww5@l3fr7phqh2ps>
 <3dd645f2-476a-d0d5-c8c1-c87307f2d756@amd.com>
 <20250310135133.GIZ87uZZNhNSkmxvg1@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250310135133.GIZ87uZZNhNSkmxvg1@fat_crate.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JD8OvLps4yTXt_GpllxtG_iJjPPPbFjal4FDD8vbdOQ_1741615191
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Mar 10, 2025 at 02:51:33PM +0100, Borislav Petkov wrote:
>On Mon, Mar 10, 2025 at 08:27:37AM -0500, Tom Lendacky wrote:
>> I don't think anything needs to be checked or printed.
>
>Yes.

Ack, I removed the check and the print.

@Boris I also removed `ret` to continue the slimming, so the end
result should be this:

bool snp_svsm_vtpm_probe(void)
{
	struct svsm_call call = {};

	/* The vTPM device is available only if a SVSM is present */
	if (!snp_vmpl)
		return false;

	call.caa = svsm_get_caa();
	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);

	if (svsm_perform_call_protocol(&call))
		return false;

	/* Check platform commands contains TPM_SEND_COMMAND - platform command 8 */
	return (call.rcx_out & BIT_ULL(8)) == BIT_ULL(8);
}

Quite nice, thanks for the review!
Stefano

