Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26404107A8
	for <linux-coco@lists.linux.dev>; Fri, 25 Aug 2023 17:09:49 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1692983381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3H5zuheq25pTXFcAoUiAM/AmAZ+5MjnbuSdvUn6CEk=;
	b=gva8oHAR5XDnqLAMsSkevg+0Gyr4qZzuCDDO664cGTNNFtqyF9n3AO4E8/VFKE45wfAzKE
	7rf3W1et014kGBYWyY7r2cKdKFKqOLp45+327glx63CGFC04OJVNhlIX5KJ4y795VlYaix
	zdx4PP0eXdNx2G5IsCdZGHyzIcbU7SxY7INahYUuvk2ThQIM5cdtcwV+HFYhDdV3v2gl0k
	nYM5WXvdTLn7gWygvGgR2FJjbho3D0+MstoexJuyD4d1nFXNiEduDewe4BsqBQjY1TUQFd
	xXntdy99QzTMleGD7lXUYk+jXvpZaVOVptjoAZnBeoG3u/464H/+6CC0RAgbIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1692983381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3H5zuheq25pTXFcAoUiAM/AmAZ+5MjnbuSdvUn6CEk=;
	b=z87NC/P17Yb270AfmmP5qOcEim6oteTECA0e6ZfijcLD5RFnQWz5yqLTO4qzXjqHVNa/BS
	QDFCJPqlfBip4VCA==
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Kuppuswamy Sathyanarayanan
 <sathyanarayanan.kuppuswamy@linux.intel.com>, Elena Reshetova
 <elena.reshetova@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/tdx: Mark TSC reliable
In-Reply-To: <20230825135226.ikxvskplvppghwtz@box.shutemov.name>
References: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
 <ecc11d54-6aaa-f755-9436-ae15b94fb627@intel.com>
 <20230808200111.nz74tmschph435ri@box> <87bkewcufi.ffs@tglx>
 <20230825135226.ikxvskplvppghwtz@box.shutemov.name>
Date: Fri, 25 Aug 2023 19:09:41 +0200
Message-ID: <87pm3baw16.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25 2023 at 16:52, Kirill A. Shutemov wrote:
> On Thu, Aug 24, 2023 at 05:49:05PM +0200, Thomas Gleixner wrote:
>> On Tue, Aug 08 2023 at 23:01, Kirill A. Shutemov wrote:
>> > On Tue, Aug 08, 2023 at 10:13:05AM -0700, Dave Hansen wrote:
>> >> I take it this is carved in stone in the TDX specs somewhere.  A
>> >> reference would be nice.
>> >
>> > TDX Module 1.0 spec:
>> >
>> > 	5.3.5. Time Stamp Counter (TSC)
>> >
>> > 	TDX provides a trusted virtual TSC to the guest TDs. TSC value is
>> > 	monotonously incrementing, starting from 0 on TD initialization by the
>> > 	host VMM. The deviation between virtual TSC values read by each VCPU =
is
>> > 	small.
>>=20
>> Nice weasel wording. What's the definition of "small"?
>
> The newer spec says "Virtual TSC values are consistent among all the TD=
=E2=80=99s
> VCPUs at the level supported by the CPU".

That means what? It's not a guarantee for consistency either. :(
