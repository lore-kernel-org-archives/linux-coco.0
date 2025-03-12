Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D0223E330
	for <linux-coco@lists.linux.dev>; Wed, 12 Mar 2025 10:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776981; cv=none; b=QQKaa00M9Ae3H1l4PZWyDL9S32tbDM38cA48LTrngQxAQJuPLEnHc40NFmyoF5D1VYCTySzOq/ZJMYb5EIktzM9cc0cnMfvfD+lkGFrFBuMHVHBI9bs3RuYxIQujKjGcdyzliAlyyn5rz3r2pUuiWID4vuK9toNOX1PimuHioKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776981; c=relaxed/simple;
	bh=C9ho3y8Z4AjksfuMtwufWo5v3OhuqO4rkMnvsa73uUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JGC5gY3Zwys/bdJxf1BWO4JNSNVf7yqMxeQkJXnvM2ZiOiu+ttSLwgXM6Dw186oKCF7fjgNjE+VcxqxJmX+sWJyWaI+sNtEdoG7mo1eSsmsyRj7yRynfEAmfgXUf+E2pYIR9UPlUoSftj0MfYzlIPtRbFtGQkNSCzAmhsqOuD5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SpJ2HcqI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SpJ2HcqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741776978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BMO4udXDunUhobQ7Fjp1hXfrNyFJ45K7k54QtO+Zp4s=;
	b=SpJ2HcqIWVyzCGYJsaZ8Izxz6T2Eh1VLwJ8sHKk6bfGSoPnWCToKx4o7LpEo1IkyjEr9XB
	qoaga9roARzZN5HLGSZr+whRx7gaJPxs7nrGQvDJZCJyGhT6+pF2u2NbpL76nUBWTwrCVP
	a2PoYTWI3WoTjeJrEXDi0BFSahEiZCk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-vCX37bPoN8Ob8kOKgB7qfw-1; Wed, 12 Mar 2025 06:56:15 -0400
X-MC-Unique: vCX37bPoN8Ob8kOKgB7qfw-1
X-Mimecast-MFC-AGG-ID: vCX37bPoN8Ob8kOKgB7qfw_1741776974
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-438da39bb69so46158475e9.0
        for <linux-coco@lists.linux.dev>; Wed, 12 Mar 2025 03:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776974; x=1742381774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMO4udXDunUhobQ7Fjp1hXfrNyFJ45K7k54QtO+Zp4s=;
        b=Mj5QCGvYhlsmDBIZQX/Uad/ps3ztOAnwMbgA58zogk3Yav5L60VSN0UeL2pE2OeSNn
         DTm2qR+YghArn8uIcDFA4v3KanGUtQhhvMiGek08PtFGKjTKQA4OSuIwU6s9vCG8ASQK
         EcOvefgTQdo1Yh/5UVL+HUFQ+s8VEj79jN/ZQiBPQCtIji3UeC9r8HIJFl7vOJUfcnzL
         GIZhIvehCM6tyWm4wCLNOZPrpoAG2dvdGbAUjXHeVw6azUXASDouDH9YwuwOc6txJDRL
         lEIlqCPC8PfZOqcAtwBzJXuFdHIA5Omub3gC2HmZkHNzNZljXOExJMkieqPe82TVOE9f
         iBaw==
X-Forwarded-Encrypted: i=1; AJvYcCVY+T2xDWq5hvjzGDIL0GmsH+N2u0/4/x0//oW5JMtJ2Ih+TOWq2UQFRa+7qaqu3bliqWcR12GXe/rG@lists.linux.dev
X-Gm-Message-State: AOJu0YznQ6+trIHMMWGdayK2x4+4YwbAQrp6ujJBLrEy36m0Jziiusa4
	nJCbSiwah83rs2+oeUAWXShFkW7aJph4QCENle6GQmNTZcszvWoyTTfbsladUPFKEtL0A38+XJe
	sBccSAtARuNF6nuw+GqyyeRYuymQOPyzGRkysW2gpuWIHADfQplZQ5gmfJCI=
X-Gm-Gg: ASbGncvtyP1bvdxBt+q1U91RjcdxZQydxCGJF+ykkk5h9gwQc+YIEATNeFzo3aAz/wO
	OXzxMW9Ku4LlWv2tljtTd2R5WH4x6uZfq149sb5wZPA3V2/m2m3AlVqWCPNWuNbZIYEyW/8h+WB
	tY3qns/Xu4njOYRCr7h0FMXX5yLEvYCzRKzdlxT1AlqcCdZQjt7b+IRJvbGmztT/M+RmqB5aVYx
	Tfql7V8xrYdwXiOHp8KUQwrh6OgDr4RMYB1CL/XXL+Rhfzr+YnKZAZlf18DhCb/OadnVoJpY2Zh
	qfDahIfHDguK7t0Qlm8G32LJWx+WG6p+uxCCncTNOWUKysJIBG+bbythzh0XWSeb
X-Received: by 2002:a05:600c:5112:b0:43d:4e9:27fe with SMTP id 5b1f17b1804b1-43d04e92abamr55444165e9.8.1741776973875;
        Wed, 12 Mar 2025 03:56:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9AMJIu9eKhF569vVgvbzoy+XnTi3xrEHJ2FOChRIcm/dKfdUJ7RQpEPKwGeSxzTGkYglWjQ==
X-Received: by 2002:a05:600c:5112:b0:43d:4e9:27fe with SMTP id 5b1f17b1804b1-43d04e92abamr55443785e9.8.1741776973173;
        Wed, 12 Mar 2025 03:56:13 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a74c6a1sm17240825e9.13.2025.03.12.03.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:56:12 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:56:06 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linux-integrity@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Dionna Glaze <dionnaglaze@google.com>, 
	linux-coco@lists.linux.dev, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 1/4] x86/sev: add SVSM vTPM probe/send_command
 functions
Message-ID: <2of2zhxi2c735fgvjxug2bxjfpz2zk25adf3h2ps5byau3rj3k@pgbxmpbskezi>
References: <20250311094225.35129-1-sgarzare@redhat.com>
 <20250311094225.35129-2-sgarzare@redhat.com>
 <Z9AIx9kFKWcHB_WK@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z9AIx9kFKWcHB_WK@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YpIMWWROX9r-gYUmbG-7ja8Uz_AF-e03dGxo3ipDAGM_1741776974
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Mar 11, 2025 at 11:56:23AM +0200, Jarkko Sakkinen wrote:
>On Tue, Mar 11, 2025 at 10:42:22AM +0100, Stefano Garzarella wrote:
>> Add two new functions to probe and send commands to the SVSM vTPM.
>> They leverage the two calls defined by the AMD SVSM specification [1]
>> for the vTPM protocol: SVSM_VTPM_QUERY and SVSM_VTPM_CMD.
>>
>> Expose these functions to be used by other modules such as a tpm
>> driver.
>>
>> [1] "Secure VM Service Module for SEV-SNP Guests"
>>     Publication # 58019 Revision: 1.00
>>
>> Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>> v3:
>> - removed link to the spec because those URLs are unstable [Borislav]
>> - squashed "x86/sev: add SVSM call macros for the vTPM protocol" patch
>>   in this one [Borislav]
>> - slimmed down snp_svsm_vtpm_probe() [Borislav]
>> - removed features check and any print related [Tom]
>> ---
>>  arch/x86/include/asm/sev.h |  7 +++++++
>>  arch/x86/coco/sev/core.c   | 31 +++++++++++++++++++++++++++++++
>>  2 files changed, 38 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
>> index ba7999f66abe..09471d058ce5 100644
>> --- a/arch/x86/include/asm/sev.h
>> +++ b/arch/x86/include/asm/sev.h
>> @@ -384,6 +384,10 @@ struct svsm_call {
>>  #define SVSM_ATTEST_SERVICES		0
>>  #define SVSM_ATTEST_SINGLE_SERVICE	1
>>
>> +#define SVSM_VTPM_CALL(x)		((2ULL << 32) | (x))
>> +#define SVSM_VTPM_QUERY			0
>> +#define SVSM_VTPM_CMD			1
>> +
>>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>>
>>  extern u8 snp_vmpl;
>> @@ -481,6 +485,9 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
>>  int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
>>  			   struct snp_guest_request_ioctl *rio);
>>
>> +bool snp_svsm_vtpm_probe(void);
>> +int snp_svsm_vtpm_send_command(u8 *buffer);
>> +
>>  void __init snp_secure_tsc_prepare(void);
>>  void __init snp_secure_tsc_init(void);
>>
>> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
>> index 96c7bc698e6b..2166bdff88b7 100644
>> --- a/arch/x86/coco/sev/core.c
>> +++ b/arch/x86/coco/sev/core.c
>> @@ -2628,6 +2628,37 @@ static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_dat
>>  	return ret;
>>  }
>>
>
>Since this is an exported symbol, it'd be a good practice document
>snp_svsm_vtpm_probe().

Yes, you are right, since the others were not documented, I had not 
added it, but I agree with you, I'll do in v4.

>
>> +bool snp_svsm_vtpm_probe(void)
>> +{
>> +	struct svsm_call call = {};
>> +
>> +	/* The vTPM device is available only if a SVSM is present */
>> +	if (!snp_vmpl)
>> +		return false;
>> +
>> +	call.caa = svsm_get_caa();
>> +	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
>
>I supposed CAA is some kind of shared memory area for host and VM?

Not with the host, but with SVSM, which is the firmware running in the 
guest, but at a higher privilege level (VMPL) than the kernel, where, 
for example, the vTPM is emulated.

BTW, yep it is a shared memory defined by the SVSM calling convention.
 From AMD SVSM specification:

   5 Calling Convention

     Each call to the SVSM conveys data through a combination of the
     SVSM Calling Area (whose address was first configured through the
     SVSM_CAA field of the secrets page) and registers. Use of the
     Calling Area is necessary for the SVSM to detect the difference
     between a call that was issued by the guest and a spurious
     invocation by a poorly behaved host. Registers are used for all
     other parameters.
     The initially configured SVSM Calling Area is a page of memory that
     lies outside the initial SVSM memory range and has not had its VMPL
     permissions restricted in any way. The address is guaranteed to be
     aligned to a 4 KB boundary, so the remainder of the page may be used
     by the guest for memory-based parameter passing if desired.
     The contents of the Calling Area are described in the following
     table:

     Table 2: Calling Area
     Byte      Size     Name                Description
     Offset

     0x000     1 byte   SVSM_CALL_PENDING   Indicates whether a call has
                                            been requested by the guest
                                            (0=no call requested, 1=call
                                            requested).
     0x001     1 byte   SVSM_MEM_AVAILABLE  Free memory is available to
                                            be withdrawn.
     0x002     6 byte                       Reserved. The SVSM is not
                                            required to verify that
                                            these bytes are 0.

>
>> +
>> +	if (svsm_perform_call_protocol(&call))
>> +		return false;
>> +
>> +	/* Check platform commands contains TPM_SEND_COMMAND - platform command 8 */
>> +	return (call.rcx_out & BIT_ULL(8)) == BIT_ULL(8);
>> +}
>> +EXPORT_SYMBOL_GPL(snp_svsm_vtpm_probe);
>> +
>
>Ditto.

Ack.

>
>> +int snp_svsm_vtpm_send_command(u8 *buffer)
>> +{
>> +	struct svsm_call call = {};
>> +
>> +	call.caa = svsm_get_caa();
>> +	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_CMD);
>> +	call.rcx = __pa(buffer);
>> +
>> +	return svsm_perform_call_protocol(&call);
>> +}
>> +EXPORT_SYMBOL_GPL(snp_svsm_vtpm_send_command);
>> +
>>  static struct platform_device sev_guest_device = {
>>  	.name		= "sev-guest",
>>  	.id		= -1,
>> --
>> 2.48.1
>>
>
>That said, these are rather self-documenting (i.e, nice and clean).

Thanks for the review!
Stefano

