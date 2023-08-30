Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCF81847
	for <linux-coco@lists.linux.dev>; Wed, 30 Aug 2023 07:33:55 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1693380827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B2Dy4Blkl2DSAvT1PmaqzM5wNIcBmLiWRy42s5HNFOs=;
	b=aDIFomfIHHCjI77hPYJQzstHXB1Xf9tbmtm4I+D1LW7PslJeqIKMCoQrJcXN5+LJ3d0BT3
	4kUDCCCyeGBWPfQO+HAkK5bvZpDRR7qgxvpjyx2+6jXRf/E/XSHoK3bjQAz3dTiThhI7If
	a4tA26wvdGrCZWZGmIFCVLfBx2z32FCB/dQPuolXupax2VofLflOtfR9cjn6yOCdd0RKVW
	fcQjRLXvKkg8AipVsd7dh7abVkqBUoDBGzCeB1gTWsfjq8vxtNbHfxsd/tOMUanUPs6Iy9
	TEMMfqaKVds9EC+Z62algK2hqBMPoqVzMSTpwi8gHwI+aYv3n25k0xxdVAdMnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1693380827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B2Dy4Blkl2DSAvT1PmaqzM5wNIcBmLiWRy42s5HNFOs=;
	b=fwdWq3mIrHdiobInaaxXQfaErzgwr80q72s88gQ1uFgYovkXqx4Le24QGwYTU6W9x6HbkI
	/jXg6s9ie7bLuCCA==
To: "Nakajima, Jun" <jun.nakajima@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Hansen, Dave"
 <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>, "Lutomirski,
 Andy" <luto@kernel.org>, Kuppuswamy Sathyanarayanan
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "Reshetova, Elena"
 <elena.reshetova@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/tdx: Mark TSC reliable
In-Reply-To: <505FB766-F79B-4D54-910E-B2EE497515FE@intel.com>
References: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
 <ecc11d54-6aaa-f755-9436-ae15b94fb627@intel.com>
 <20230808200111.nz74tmschph435ri@box> <87bkewcufi.ffs@tglx>
 <20230825135226.ikxvskplvppghwtz@box.shutemov.name> <87pm3baw16.ffs@tglx>
 <505FB766-F79B-4D54-910E-B2EE497515FE@intel.com>
Date: Wed, 30 Aug 2023 09:33:47 +0200
Message-ID: <87wmxd56hw.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29 2023 at 16:01, Jun Nakajima wrote:
>> On Aug 25, 2023, at 10:09 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
>>> The newer spec says "Virtual TSC values are consistent among all the TD=
=E2=80=99s
>>> VCPUs at the level supported by the CPU".
>>=20
>> That means what? It's not a guarantee for consistency either. :(
>
> Actually (in TDX Module 1.5 spec), the sentence is "Virtual TSC values
> are consistent among all the TD=E2=80=99s VCPUs at the level supported by=
 the
> CPU, see below=E2=80=9D.
>
> And the below:
> ---
> The host VMM is required to do the following:
> =E2=80=A2 Set up the same IA32_TSC_ADJUST values on all LPs before initia=
lizing the Intel TDX module.
> =E2=80=A2 Make sure IA32_TSC_ADJUST is not modified from its initial valu=
e before calling SEAMCALL.
>
> The Intel TDX module checks the above as part of TDH.VP.ENTER and any
> other SEAMCALL leaf function that reads TSC.

What happens when the check detects that the host modified TSC ADJUST?

What validates the VMCS TSC offset field?

> The virtualized TSC is designed to have the following characteristics:
> =E2=80=A2 The virtual TSC frequency is specified by the host VMM as an in=
put
> to TDH.MNG.INIT in units of 25MHz =E2=80=93 it can be between 4 and 400
> (corresponding to a range of 100MHz to 10GHz).

What validates that the frequency is correct?

How is ensured that the host does not change TSC scaling?

Thanks,

        tglx
