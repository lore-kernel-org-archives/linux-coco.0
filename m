Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADDE82D99
	for <linux-coco@lists.linux.dev>; Fri, 19 Apr 2024 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713527563; cv=none; b=glyh1ba5ylwzDxYfBdkp20IJC2gNOuQJCAzsqleYhrd9jTmbMGD9OhNPt1yw5yYOxVFV2WTTqNcm529PObe21HegKKeNMZI/TPju732bIvTjnTS0BDhlqNPcVGjng/ihxg2qw4BFBZDKacE+6mxRPrOPsWXbCLouj9NWD+N0JWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713527563; c=relaxed/simple;
	bh=+HnpYIljW903ODlD5/xLD4aOITxYFLDumzggzFZ3LXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=livPMAwRC7KeHYJxW1eTjQMhAygwcO7hXRUzjayyYZ/5s0XD4xhOZuQOsV9/CA4feLlBGayOTt2tC2Z0x3/CPQJTUktOmTKEzYBjiwUCpiyJTQjIOTdEKnAf5oxSvcLL+yHoA+//5gzWDNrUQv7miPV3sy6VFV5n0lF98ILZXM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KsIpYx5u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KsIpYx5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713527561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9gAW74TdLSgAKKdOeHRcIuNI+2QlXI+dYyfePDOsqM=;
	b=KsIpYx5uQs30IWmOQqq4s+NVf4mygzvyBiEdQ8gmq9zEorf1S0WvYQKToiWguG40b5Pwzy
	4SA7SdEVL5/2ssINRcUcxB3ulBGoynqgqo8sJTt/yEsGINy+MHGoSUib8bigTjdFjtkHgk
	S7OBK8o7fYBMXdwImCmY7EB52dYIHSc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-mYpUD6BmOw6-pC0fecLCGQ-1; Fri, 19 Apr 2024 07:52:37 -0400
X-MC-Unique: mYpUD6BmOw6-pC0fecLCGQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34a49f5a6baso586846f8f.3
        for <linux-coco@lists.linux.dev>; Fri, 19 Apr 2024 04:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713527557; x=1714132357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9gAW74TdLSgAKKdOeHRcIuNI+2QlXI+dYyfePDOsqM=;
        b=Bm9d7o+Tzoli6V8rKQBJ0AMxhNbqXEbDvBBitSkp/Ptv6jy/uoKxGpaVcxZB5e7eP7
         F9TnLbFTLgbZLoh/HPC/xo1yo8yZSlN88PJkARR3uMklfhMqyclyge4/cyjxyVcytWo5
         kR7gr6AsdE7dkm02/DXBSC6rphyy+yE4MncAwoSaFARmrjd0UG9hwfdm9lRj6HE8cySy
         k+1//vfWINxficqNfMjtOjr/4ZZJs4pOK7Z9S5Ml3USc9Rr4UiKggxsvmXSQZ00b7Itx
         QxA0QR0P+G7udU5S0GVaBMsJ1xmoJKMrwRUMBmCJ4hMbJ4XEcFOhAC+M2wKm7y20jsZJ
         l5+g==
X-Forwarded-Encrypted: i=1; AJvYcCUf3wukOS93VOToRgusQcKb3wG1vFyNs0ECI6GgbdUQeUOJqtwbtH0mkVPZAqPbce1yr5/SLMaKrkaVHuX21JuYqcJ31fAEeN7Lxg==
X-Gm-Message-State: AOJu0YzG6ivKhCCxjVvzPEDhUnxT8BZw3b9LBfXXVTK9uQgQ/J4sobnI
	GvjsW4sYi5W7O+S/3NBjf5DuMkEhds+H0xNcxGcMvl8F6SdX6V/opIiGAbNTBZV/ZtUS6OSvHKj
	6xcRRFBh3NXnDwMG9+tbij8mspzXcTr9rG1C10CLpwOq+eHZxrDPnWfrzLd47xgeOObjGewthbr
	kyl6CJiRPon/6Zy6o7+5RxAa9XYcACX5eKjQ==
X-Received: by 2002:adf:e683:0:b0:345:605e:fa38 with SMTP id r3-20020adfe683000000b00345605efa38mr1433591wrm.60.1713527556822;
        Fri, 19 Apr 2024 04:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfUJrGef9Pu8qycGP8hLzLT/FO8q371w7fw92YbXK5+2PaDsTI6UQGUVVeBTULcSVYlzzGDl9d79lt6LyM70w=
X-Received: by 2002:adf:e683:0:b0:345:605e:fa38 with SMTP id
 r3-20020adfe683000000b00345605efa38mr1433571wrm.60.1713527556446; Fri, 19 Apr
 2024 04:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240418194133.1452059-1-michael.roth@amd.com> <20240418194133.1452059-10-michael.roth@amd.com>
In-Reply-To: <20240418194133.1452059-10-michael.roth@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 19 Apr 2024 13:52:24 +0200
Message-ID: <CABgObfYztTP+qoTa-tuPC8Au-aKhwiBkcvHni4T+n6MCD-P9Dw@mail.gmail.com>
Subject: Re: [PATCH v13 09/26] KVM: SEV: Add KVM_SEV_SNP_LAUNCH_START command
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, seanjc@google.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 9:42=E2=80=AFPM Michael Roth <michael.roth@amd.com>=
 wrote:
> +/* As defined by SEV-SNP Firmware ABI, under "Guest Policy". */
> +#define SNP_POLICY_MASK_API_MAJOR      GENMASK_ULL(15, 8)
> +#define SNP_POLICY_MASK_API_MINOR      GENMASK_ULL(7, 0)
> +
> +#define SNP_POLICY_MASK_VALID          (SNP_POLICY_MASK_SMT            |=
 \
> +                                        SNP_POLICY_MASK_RSVD_MBO       |=
 \
> +                                        SNP_POLICY_MASK_DEBUG          |=
 \
> +                                        SNP_POLICY_MASK_SINGLE_SOCKET  |=
 \
> +                                        SNP_POLICY_MASK_API_MAJOR      |=
 \
> +                                        SNP_POLICY_MASK_API_MINOR)
> +
> +/* KVM's SNP support is compatible with 1.51 of the SEV-SNP Firmware ABI=
. */
> +#define SNP_POLICY_API_MAJOR           1
> +#define SNP_POLICY_API_MINOR           51

> +static inline bool sev_version_greater_or_equal(u8 major, u8 minor)
> +{
> +       if (major < SNP_POLICY_API_MAJOR)
> +               return true;

Should it perhaps refuse version 0.x? With something like a

#define SNP_POLICY_API_MAJOR_MIN    1

to make it a bit more future proof (and testable).

> +       major =3D (params.policy & SNP_POLICY_MASK_API_MAJOR);

This should be >> 8. Do the QEMU patches not set the API version? :)

Paolo

