Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01654A21
	for <linux-coco@lists.linux.dev>; Fri, 13 Dec 2024 11:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734090543; cv=none; b=UQZZh1kCMNvEguCPr1yYjyeFpELLbs9HyqKs7VZJauC6LUIh3RvwljZQ3QJB39wpYSJLgOGfSGMTqx536Z5+S5vszFA2mcbJCm5limvf2eTdVilMRfPDjgHE8RAbn7IMZj1oSIr1ICg+m7tuT8iltnPrzEx65N9xS7DA7wHgMQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734090543; c=relaxed/simple;
	bh=QGT2SF2RrviqaJQfbCFot02KwB9XhZnwgAtpBU5l9lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=B7rmetzOo9blmv+JUJeryJW62BAdN+nevoIIcvdFEv2oYCgvHTfhgSe3fumoMWE7KnxN8f12ZYqKzxvjWcZtz+EeMZeVmcvxVELnfYZZTvbHma3DxhxnG0o4J2c230f9E7YpO3Pgt1sluD2rt3NPD0PCWCEvgY+DJr3N0d7/464=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eb0fMbi9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eb0fMbi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734090540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Pp0PgMN56ieGrHNFi7i6KMaUXuRE1vzehzF7+bFcb8=;
	b=eb0fMbi9csmZfFfgPdJx+nxNirr1mG1/M3KNyn+pooCoxN1B1UAjZ+CMFF5n7+Ug51GDej
	ZgbQ2yvjb+69Tf+lPASDUi49dDcxuwtj3Ib85NDuozXVp6szWwB/JxSyEV+T+gFFc7ym4s
	qEu8tXybX3sjFKadNQIpDMgYSy+rL1E=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-GQa8-z-hMQygWjgjTCIwQw-1; Fri, 13 Dec 2024 06:48:59 -0500
X-MC-Unique: GQa8-z-hMQygWjgjTCIwQw-1
X-Mimecast-MFC-AGG-ID: GQa8-z-hMQygWjgjTCIwQw
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6faab8334so120306285a.2
        for <linux-coco@lists.linux.dev>; Fri, 13 Dec 2024 03:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734090539; x=1734695339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Pp0PgMN56ieGrHNFi7i6KMaUXuRE1vzehzF7+bFcb8=;
        b=I+et6RXj2CSsj2jBIxJYgPUCQDT6e2oKdpIOVXJvmOcy7VIqzVhU0cAuQogOjAXmEG
         lNoKtLeeO8Ijoh+b8UGLXAC0/u2I0/SfO8afZskbkA3P3dsS/kI0Ag0V3vy+DD6151H6
         gzL22ow9Q71j1YLmdYH1Mw0eEqLk8DOHFumI1LhgzaOCiNe71TO3BR35z+bI1QVSyBxB
         +/+XAFSCRBH7hJYMbxBHkhSD7eucz6lneXvvUiUJp7jdnq92bZWcvpXWD6G0GH17ZL92
         ekLLuFHxfzJo1FqolAjU5CznNT6nXKqD1GZS1oVS7Tvmn2nk3krO+Bn2i8mskOa8Egje
         Uvng==
X-Forwarded-Encrypted: i=1; AJvYcCWDqa4iF8jhU6eD/GUuz0N64Qr+FgPMAV4f0cxOhjfj3ybyPvUjSjmJ9HXfz09eSN3D+Qqdb7Vi7wJM@lists.linux.dev
X-Gm-Message-State: AOJu0YxGicP8ISgQVkf0JejkP9cs+ZORQmYtCgyhDGXrHK8aNbJrKaGi
	qEneoY26ZvwJsJCyWFGc1I+aMxGGMh/oFOsh805TTAWTshhwhTYE37UeCj5P4WauKM7xX1JryAH
	dwlEdpssTy0CdlpYy51zc2C2P+mLn+dRBEBzgSLjp+2Wk6asyqpA+hD91N9k=
X-Gm-Gg: ASbGncv5SYj2vej49m8xmhnU2umwM60PPxx6eKyguVGhcQYMZXcqNGEGr4UhFRhPTM0
	dwl5xnolEkyBekOtratbZyZ7fBjLkamomtE9xlh8z26a3RMSxQjAM41UyjUVcvQlPAhpFQtAMZY
	tYuiUItkmKTzZBi59QVbdSy/hQJiE9yfqs51f5SsUjSjTyJAI/s11osNjfbteLsAPD/va7x/VfB
	8XL1wDLYIxq/rfaHoycTo7cLem/hE1NVkPbeNDhBZPYcGcA17TlGOwQ5B9B9Uj447nBVbVyRxnP
	+Q27PHesVW1PG9KOEon7djPQ766kmTFM
X-Received: by 2002:a05:6214:2622:b0:6d8:a5dc:866e with SMTP id 6a1803df08f44-6dc96998c54mr41274716d6.47.1734090539038;
        Fri, 13 Dec 2024 03:48:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVe9Bmg971vhiBdlReKshUrR7Ut9jwZGEsYOm0pIixkfuL80sk4rWNQhEv9/FV31WsOy9c9w==
X-Received: by 2002:a05:6214:2622:b0:6d8:a5dc:866e with SMTP id 6a1803df08f44-6dc96998c54mr41274186d6.47.1734090538603;
        Fri, 13 Dec 2024 03:48:58 -0800 (PST)
Received: from sgarzare-redhat (host-87-12-185-21.business.telecomitalia.it. [87.12.185.21])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da673441sm90963686d6.1.2024.12.13.03.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 03:48:58 -0800 (PST)
Date: Fri, 13 Dec 2024 12:48:50 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-coco@lists.linux.dev, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Huewe <peterhuewe@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-integrity@vger.kernel.org, x86@kernel.org, Joerg Roedel <jroedel@suse.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
Message-ID: <4valfkw7wtx3fpdv2qbymzggcu7mp4mhkd65j5q7zncs2dzorc@jjjevuwfchgl>
References: <20241210143423.101774-1-sgarzare@redhat.com>
 <20241210143423.101774-4-sgarzare@redhat.com>
 <f8c6c1e0-a42d-6fa6-a10e-925592d7992f@amd.com>
 <9083d4cd50649ea1971e31445c554f44e8d12bf9.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9083d4cd50649ea1971e31445c554f44e8d12bf9.camel@HansenPartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PSvPtoyN7yIxkmGwJXguBcJHE9Yp1eZjLqBGdV0OMsY_1734090539
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Dec 11, 2024 at 12:02:49PM -0500, James Bottomley wrote:
>On Wed, 2024-12-11 at 10:30 -0600, Tom Lendacky wrote:
>> On 12/10/24 08:34, Stefano Garzarella wrote:
>[...]
>> > +static bool is_svsm_vtpm_send_command_supported(void)
>> > +{
>> > +       struct svsm_call call = {};
>> > +       u64 send_cmd_mask = 0;
>> > +       u64 platform_cmds;
>> > +       u64 features;
>> > +       int ret;
>> > +
>> > +       call.caa = svsm_get_caa();
>> > +       call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
>> > +
>> > +       ret = svsm_perform_call_protocol(&call);
>> > +
>> > +       if (ret != SVSM_SUCCESS)
>> > +               return false;
>> > +
>> > +       features = call.rdx_out;
>> > +       platform_cmds = call.rcx_out;
>> > +
>> > +       /* No feature supported, it must be zero */
>> > +       if (features)
>> > +               return false;
>>
>> I think this check should be removed. The SVSM currently returns all
>> zeroes for the features to allow for future support. If a new feature
>> is added in the future, this then allows a driver that supports that
>> feature to operate with a version of an SVSM that doesn't have that
>> feature implemented. It also allows a version of the driver that
>> doesn't know about that feature to work with an SVSM that has that
>> feature.
>>
>> A feature added to the vTPM shouldn't alter the behavior of something
>> that isn't using or understands that feature.
>
>I actually don't think this matters, because I can't see any reason to
>use the SVSM features flag for the vTPM.  The reason is that the TPM
>itself contains a versioned feature mechanism that external programs
>already use, so there's no real need to duplicate it.
>
>That said, I'm happy with either keeping or removing this.

If we remove the check, should we print some warning if `feature` is not 
0 or just ignore it?

Thanks,
Stefano

