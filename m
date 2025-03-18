Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA861F4C8C
	for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292491; cv=none; b=rBvaONkM/ui6vhcB9P3oQFudCxfm8lNGZt/2s3iUp85hZLmsSkN5rhiqo/G4rRIt2onZdDWzMmK1fNuOHsD2F7P+BYLdm8Qo4BGabXYQQguXC15PPU9bAYX6cSUxffNlAT/TwZVOAFMfz9PEFU1nc6gijigdENtY+gWSAikLiTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292491; c=relaxed/simple;
	bh=D2uC7q/GfIgxv9SCiH9wXFsiCXWQ3GihsbEJk75avVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=f5tXY+/NcR2KZREjWBeHT39iKMge4pvMsavRzExq5i/ZOhY3TLPc/oItv7QsfI0AD9t0BTSTPFkL8+NeITF2hUoLDWZX6xSANw2p2A5Ye9WHOnn9UpRXrpoFJIsKEaNeGNs1vOOtGjsIArYeFH5ojpk1fzXAM5Kh5vfltGb/GrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUS50Ffc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUS50Ffc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742292488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IEvuZKB25WkNV582zeCY6U1/wQrHODlGoWn807RLAj4=;
	b=XUS50Ffc95gTvPsSI4/DkQ2KPUWQMzbFVGELgffxtvwexyebWstyLl29Nw2tESdn0u62Cz
	FnHkJMvmhby+GUVLmrcIHxV+2WwGy3KeWASo3hCswE6QI03RuRYdMt5lTY6eGMMtNYgGCw
	C/UWeno4pTMn++VN2lL4Mw+zNNzo1Dc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-LadO_1cOPtyMIOjSSRv8PA-1; Tue, 18 Mar 2025 06:08:05 -0400
X-MC-Unique: LadO_1cOPtyMIOjSSRv8PA-1
X-Mimecast-MFC-AGG-ID: LadO_1cOPtyMIOjSSRv8PA_1742292484
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-390f3652842so2830234f8f.1
        for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 03:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292484; x=1742897284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEvuZKB25WkNV582zeCY6U1/wQrHODlGoWn807RLAj4=;
        b=eW8JZUJLzzp96MQ1VFemTqdi0rn0C04O/ppJxBmLVwiBKXvR7cYZZ1q533AUgGXRBK
         Z268wdlpGH23GZSBEg3qGMn7UgYOlEF83L0nryyx05ZtoI2vdebzYQVBt7eH3XOA1joI
         ypAeqK3liINkob4l3PIBazcqwclq9+/53nkshpZgUGzqIKt4KjzAZlqYoX2em7R3C47I
         68NUbxVzwVqETOvVbDpHJGRXlPQNlvkxLVKYoMza2xc7in44rPB+y1WEcWDMXfBOYmz1
         LyYST7nog1eHQNYmF27LCXatKCJ/kNfCn8JjU34uioNDKiJTsOBrNd8GQUelDxT97X/W
         UCPA==
X-Forwarded-Encrypted: i=1; AJvYcCUnXjo5axudFNFnfYVO8GfsUtg0gmBv1kKuLKxIh/P4eUUFcRQkiFMIRSF7w37P8CIgy5MY8Xu9vGfP@lists.linux.dev
X-Gm-Message-State: AOJu0YybFzJ32JJCO33t2BdH0jSBLipvJZI6aKu63h0QO7keYPEbCbLp
	URy486Qy3ZDtw4scuSdKMkYz7LzogrkzU1HOlKyulStkC+SLhZYNILcF1/v4RBA/tmjh+eB0MZU
	zmG1rNq6QXKUQJ0YSDXf+/HsctFYih1bwrHnEBQ/YZGEdjGw4hdPsPMlGjN0=
X-Gm-Gg: ASbGncvGajop8AI025axfpox75M4HMea8fZOAv+BaTLwi3vbjXd5ekKXaZVU4qIWqip
	Mnwjw+l62cGtD1v2Re1hGMfxW04ELhNow28DiLLuxB4YgiEj0Tzh6pQiReOS6UFzFGzDdKnXexX
	4TPlc4mODSXHCmoupuKNq2PDXQBBbQ8IEWaojQDx0UMw0v+tKp2lUQ495VgRXvWJQnAWA1i9f/q
	FDt3jSUJYf0awCm8zyppO3XolfZ51Wsd5AdoFFrlJ4jStqSVm7D71qr31gheSvCNBMSKqpuAJzT
	YH272cBfxaE23JOqwaMhZeISfykVMOAUNouZ8mn713FjbMuj4FMp4OsZjcY8rS4z
X-Received: by 2002:a5d:6da4:0:b0:391:3fde:1da with SMTP id ffacd0b85a97d-3996b446894mr2484880f8f.16.1742292483838;
        Tue, 18 Mar 2025 03:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh3gn7eHXqYAXq/xhJqTxFL+gTLLmKxOf4FLaroBA677Z+26ult7+GExyxZ1z7z5eEbfIXIQ==
X-Received: by 2002:a5d:6da4:0:b0:391:3fde:1da with SMTP id ffacd0b85a97d-3996b446894mr2484848f8f.16.1742292483336;
        Tue, 18 Mar 2025 03:08:03 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6e92sm17909112f8f.38.2025.03.18.03.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 03:08:02 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:07:57 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@alien8.de>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	x86@kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Dionna Glaze <dionnaglaze@google.com>, 
	linux-coco@lists.linux.dev, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 1/4] x86/sev: add SVSM vTPM probe/send_command
 functions
Message-ID: <7kuhiyy7gj4py323g5n2vy3ddlg666zwhtx3mjcklebgtlstdc@xgdyeecifwei>
References: <20250311094225.35129-1-sgarzare@redhat.com>
 <20250311094225.35129-2-sgarzare@redhat.com>
 <d7e5a1d2-5fcc-bf7f-a67d-7871a1627c98@amd.com>
 <Z9glWp6U6vyEmKQa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z9glWp6U6vyEmKQa@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ej3mxP5G3wf8_TV72WRih2qRC-WSZMaNr5LgtkW0Jk4_1742292484
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Mar 17, 2025 at 03:36:26PM +0200, Jarkko Sakkinen wrote:
>On Fri, Mar 14, 2025 at 10:27:07AM -0500, Tom Lendacky wrote:
>> On 3/11/25 04:42, Stefano Garzarella wrote:
>> > Add two new functions to probe and send commands to the SVSM vTPM.
>> > They leverage the two calls defined by the AMD SVSM specification [1]
>> > for the vTPM protocol: SVSM_VTPM_QUERY and SVSM_VTPM_CMD.
>> >
>> > Expose these functions to be used by other modules such as a tpm
>> > driver.
>> >
>> > [1] "Secure VM Service Module for SEV-SNP Guests"
>> >     Publication # 58019 Revision: 1.00
>> >
>> > Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> > Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> > Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> > Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>
>> One minor nit below, otherwise:
>>
>> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

Thanks!

>>
>> > ---
>> > v3:
>> > - removed link to the spec because those URLs are unstable [Borislav]
>> > - squashed "x86/sev: add SVSM call macros for the vTPM protocol" patch
>> >   in this one [Borislav]
>> > - slimmed down snp_svsm_vtpm_probe() [Borislav]
>> > - removed features check and any print related [Tom]
>> > ---
>> >  arch/x86/include/asm/sev.h |  7 +++++++
>> >  arch/x86/coco/sev/core.c   | 31 +++++++++++++++++++++++++++++++
>> >  2 files changed, 38 insertions(+)
>> >
>> > diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
>> > index ba7999f66abe..09471d058ce5 100644
>> > --- a/arch/x86/include/asm/sev.h
>> > +++ b/arch/x86/include/asm/sev.h
>> > @@ -384,6 +384,10 @@ struct svsm_call {
>> >  #define SVSM_ATTEST_SERVICES		0
>> >  #define SVSM_ATTEST_SINGLE_SERVICE	1
>> >
>> > +#define SVSM_VTPM_CALL(x)		((2ULL << 32) | (x))
>> > +#define SVSM_VTPM_QUERY			0
>> > +#define SVSM_VTPM_CMD			1
>> > +
>> >  #ifdef CONFIG_AMD_MEM_ENCRYPT
>> >
>> >  extern u8 snp_vmpl;
>> > @@ -481,6 +485,9 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
>> >  int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
>> >  			   struct snp_guest_request_ioctl *rio);
>> >
>> > +bool snp_svsm_vtpm_probe(void);
>> > +int snp_svsm_vtpm_send_command(u8 *buffer);
>> > +
>> >  void __init snp_secure_tsc_prepare(void);
>> >  void __init snp_secure_tsc_init(void);
>> >
>> > diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
>> > index 96c7bc698e6b..2166bdff88b7 100644
>> > --- a/arch/x86/coco/sev/core.c
>> > +++ b/arch/x86/coco/sev/core.c
>> > @@ -2628,6 +2628,37 @@ static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_dat
>> >  	return ret;
>> >  }
>> >
>> > +bool snp_svsm_vtpm_probe(void)
>> > +{
>> > +	struct svsm_call call = {};
>> > +
>> > +	/* The vTPM device is available only if a SVSM is present */
>> > +	if (!snp_vmpl)
>> > +		return false;
>> > +
>> > +	call.caa = svsm_get_caa();
>> > +	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
>> > +
>> > +	if (svsm_perform_call_protocol(&call))
>> > +		return false;
>> > +
>> > +	/* Check platform commands contains TPM_SEND_COMMAND - platform command 8 */
>> > +	return (call.rcx_out & BIT_ULL(8)) == BIT_ULL(8);
>>
>> It's a bool function, so this could simplified to just:
>>
>> 	return call.rcx_out & BIT_ULL(8);

Sure.

>
>Or perhaps even just "call.rcx_out & 0x100". I don't think BIT_ULL()
>here brings much additional clarity or anything useful...

I can do that, I slightly prefer BIT_ULL() macro, but I don't have a 
strong opinion on my side.
@Borislav since you suggested it, WDYT?

Thanks,
Stefano

