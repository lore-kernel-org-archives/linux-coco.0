Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CD31DC184
	for <linux-coco@lists.linux.dev>; Tue, 18 Feb 2025 23:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739923085; cv=none; b=iRZ8JiCkqgPLTsnZLrmSUoOR9Sjif3mRWiYQ2Pi8Ql0btYO9lFtn4ztFJ+4C3paNqcH4Vrm9/9Wzs2wtbCVNBjq72hh5cgs/RLrdvj0GwvWSovMiaOpst1LNPt4qgWN4dhr5RiRA5RmdUUivuryxRHxCWXTm6OhNOsdtWPh3YkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739923085; c=relaxed/simple;
	bh=fC1P3XC32NnXo00sjdLw5qb9N9oKkD+Omqv1rR0S5FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRpcu0aJkg9QtSCZL4UG0MRziSv7pNC5wZMw8ZkmT9oq7gW+BY5fVq66xGRF1EL56vm8UyOX0KdOuBs/vl3uCbSBY98Z5QHvgdc+tMr/MHifukpeW6DLj5L4y8u000rkeDe0peJQVeyRp0Qhqv+s8CC/zrngCXzNiDnealp/2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jG13MJ20; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jG13MJ20"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aba868c6e88so744477966b.2
        for <linux-coco@lists.linux.dev>; Tue, 18 Feb 2025 15:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739923082; x=1740527882; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fC1P3XC32NnXo00sjdLw5qb9N9oKkD+Omqv1rR0S5FE=;
        b=jG13MJ20IByw1Y0rCd4qSB6vvb40/8yFhAzy6nUtoE4cb0rev+jFd3WNFlK+I054Qx
         C480pwr8Of+PCVr2D+oMa/0p4j2je/ihuGVnBo+lCu+i8KMHPrufxWyVJdkqKzy5vaVu
         hUDpmNc2vdCYRtVUvcVvJ1OJuveO+x+UgcNus+FmDUO4S2cIwtKW5ibcacX/azyZkKRn
         Js6yow/cK3ZgVdkU+M1s0VhkCcusENoN4TPbgPuCxFqljcxKpADWcdq1o8UrSNWMMKZq
         h4LSHXPvtScXTSRAyQP8gnVVL46to2TPS+LCfZslUAjJLmf+Cz9j5SJu7t2lbSSkHk1d
         LPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739923082; x=1740527882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fC1P3XC32NnXo00sjdLw5qb9N9oKkD+Omqv1rR0S5FE=;
        b=XqmeKULPPO06bwXq/jAD7BkUT4RtPhi2qxevbGzTfOczgqxUxRT7cA4haJZSQfNfwa
         Y4UHzCOJGg3mdDtOb+gmd0dYFgSoRTvp3TSBP5moeg1RDn03fhGk7vv/LZ69DiuurZIb
         OqdyhgA3oxx13ukajPVEhGA61c1EIVVUSFUSjhaLHdkz/f/FbrCX1uIbA6/c04dshB3Q
         NcMY1fpy6KxsXkdl3LZi4cFshsMm8gTJW0bGU/CBWjn/xqLbOSLtRDU0hjTZqrGnWIrD
         uDcMFBTyvBbY96JhZsXPxxzTRgVFn/s9yNSYeHxoUVceg+Zfo8FmeXwnwDo3BoC9UXl2
         J2Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV/1z+0gGPtRe7csVCQT7XDydRK6FXUXv2ZP355YUyIoZBaWuqkpHkDi4gE0fgN9YtzHz+/dO1t3VaI@lists.linux.dev
X-Gm-Message-State: AOJu0YxWJqg/Q/wKMdO71GY+/JSU+FSrJrg5VOaKvnlJaAJv4cTyRbBA
	R+WigyHzvWad2JESwth5+h69S5SLT2+b+UmnklwkpaFAaYezRXl3i4a7JLFvjqMLwQHNYPql91g
	PAYi3FowLZjlf2b05b5wBZtlouTlgD8QXjg8g
X-Gm-Gg: ASbGncuInTklUKwud/8J5uZMx89cbLlTp2XpXIykzxgGQt0Hx4+mqsn2cQdlPrkYPkT
	FMbCddI3vCnu1RisYO2b4n/WxpUbr2pJ37iwxmy8OCj90brlCkHd9OA2MngeL5DVZBY8+P1g8
X-Google-Smtp-Source: AGHT+IFrQ15TJ33fdYF/oTMtbCii+ZRQfmSIkaWviOKdP/iHummReS5upGdEbovHEhto8hKzDWcCHzZn9/UWQZ+2rDM=
X-Received: by 2002:a17:907:60c9:b0:ab7:d361:11b4 with SMTP id
 a640c23a62f3a-abb70a7c9c4mr1630995466b.7.1739923081760; Tue, 18 Feb 2025
 15:58:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250212-tdx-rtmr-v1-0-9795dc49e132@intel.com>
 <15c69d57-4ffb-4ea1-8cbc-0ba6d3d7b14f@intel.com> <be7e3c9d-208a-4bda-b8cf-9119f3e0c4ce@intel.com>
 <015cdddb-7f74-4205-af8a-b15cad7ddc22@intel.com> <d8f3eb33-d902-4391-adc7-005e4895b471@intel.com>
 <c7894df2-2b27-4f67-b428-3eca312503f9@intel.com> <c2cf2184-7753-454e-ac99-8c4f3c9c3d16@intel.com>
 <01fc0997-a0e7-4086-b0aa-67b4a51b328a@intel.com> <12ed2ab1-e97d-4a20-8370-8c60cabffc77@intel.com>
 <ab2036d5-5b6f-4fa9-995a-fba63c0a5209@linux.intel.com> <f4d344de-70c2-4fd4-bb18-2912cf0f3f98@intel.com>
In-Reply-To: <f4d344de-70c2-4fd4-bb18-2912cf0f3f98@intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 18 Feb 2025 15:57:49 -0800
X-Gm-Features: AWEUYZlz10uZ3RgXyh6tsNf75k8mF_KZ5dIIh28yA3hngdsabEPbjxarUn5eOH0
Message-ID: <CAAH4kHYq7_3vLXQaCA7iKF+mC5Pg0cn-1FsB-iCbN7Jim9a-OQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] tsm: Unified Measurement Register ABI for TVMs
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dan Middleton <dan.middleton@linux.intel.com>, "Xing, Cedric" <cedric.xing@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 8:57=E2=80=AFAM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 2/18/25 08:25, Dan Middleton wrote:
> > One common reason is to _identify the workload_ running in the VM.
> > Typically a VM attestation tells you that you booted to a clean state.
> > It is much more valuable to a Relying Party to know that they are
> > interacting
> > with a trusted application / workload.
> > Projects like CNCF Confidential Containers [1] and Attested Containers
> > [2] would like to do this.
>
> That's a _bit_ of a different story than the series author mentioned here=
:
>
>
> https://lore.kernel.org/all/be7e3c9d-208a-4bda-b8cf-9119f3e0c4ce@intel.co=
m/
>
> It would be great to see a solid, consistent story about what the
> purpose of this series is when v2 is posted. As always, it would be even
> better if it was obvious that this is not tied to one vendor or one
> architecture.
>
> If there are actual end users who care about this, it would be great to
> see their acks on it as well.
>

We would like to have this for Google Confidential Space and Kubernetes Eng=
ine.

Acked-by: Dionna Glaze <dionnaglaze@google.com>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
