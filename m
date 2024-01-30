Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732CE1272DA
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 18:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706639084; cv=none; b=ESybS7Xc0d41PqnD6ep+HG986n/pQ6bSV+ETbBgl8lLCfKOP1fODGxuBFWyzsAROs/r8iJx1hKHWDJ5mJqIXM1JRDuF8ZFjRRb/X8sqMleBZtYfbThiAjDFVfTdi9qLKmLaOh1pOK3yoDrt8jyGbWPBopD0zmLRQqbdBWEgxGUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706639084; c=relaxed/simple;
	bh=YUmfBWFQ6tCEpoMRctNdicF/PTXXo5NEZEPkn6VcDTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fviH3pYb0nONhohQuHCi+2MJOBPUuV60WU0jsU826MNt+KVjoM0Fr/rkfWFwOIC7Il/YNSm9w/aAqdb7MNRJowWRVpjXwag92iAagYaAhQcvHrggRjN6Ey9+RJUAqxS/oIGHvPNhefRpgkCmDtT5vl/XUnpxHheTTbSfM020QVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=gcywChRk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gcywChRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6896C43390
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 18:24:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gcywChRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1706639082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUmfBWFQ6tCEpoMRctNdicF/PTXXo5NEZEPkn6VcDTI=;
	b=gcywChRk9C9EfkvBCWSeF9jKKanK4DMvWfgFTKboEjcAhVLkjtwZnoG8yNxt7je8xrkq1s
	LgXdgaNglLsN1Daf24pb0dnL7c8WeQIZDXlcZ9RrO6BtNzJXaAw1k0jkB74CkrR9sIOwoD
	S3rOlzguUuWB46PzMh3oFuTI4qtxE98=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ebf0a6ee (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Tue, 30 Jan 2024 18:24:42 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5edfcba97e3so47234577b3.2
        for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 10:24:41 -0800 (PST)
X-Gm-Message-State: AOJu0YyiFdWdBCYZ88Jj8YnjEd3jW3RnZ36q8sk35hDQv8RFDq0ibJKp
	T/lIkrBC5f06I7Ddgve5cET7AOQ4u2fzdmfpXIxFy5w/5cD20ZjVv1xilwe2BqwjYMo8kgLzo5S
	A/yia7+vcOUxyEzCLnnvkMBnjQFk=
X-Google-Smtp-Source: AGHT+IHs1X6GyHofuCm5wWklYUOEkGmQh3S2SxOZMW5eNxNCRUnzVnAuGciDZbV+el+aoBZWnYUODQffo17X7ao8AVE=
X-Received: by 2002:a81:c74d:0:b0:5ff:4e3b:dc89 with SMTP id
 i13-20020a81c74d000000b005ff4e3bdc89mr6687543ywl.11.1706639080294; Tue, 30
 Jan 2024 10:24:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130083007.1876787-1-kirill.shutemov@linux.intel.com>
 <20240130083007.1876787-2-kirill.shutemov@linux.intel.com>
 <CAHmME9qsfOdOEHHw_MOBmt6YAtncbbqP9LPK2dRjuOp1CrHzRA@mail.gmail.com>
 <DM8PR11MB57507611D651E6D7CBC2A2F3E77D2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <88a72370-e300-4bbc-8077-acd1cc831fe7@intel.com> <CAHmME9oSQbd3V8+qR0e9oPb7ppO=E7GrCW-a2RN8QNdY_ARbSQ@mail.gmail.com>
 <Zbk6h0ogqeInLa_1@redhat.com>
In-Reply-To: <Zbk6h0ogqeInLa_1@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 Jan 2024 19:24:29 +0100
X-Gmail-Original-Message-ID: <CAHmME9rq-_f9C=DMjjYeCXFcMrCooD-AYVZVj2oF8Je7ztGnTw@mail.gmail.com>
Message-ID: <CAHmME9rq-_f9C=DMjjYeCXFcMrCooD-AYVZVj2oF8Je7ztGnTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/random: Issue a warning if RDRAND or RDSEED fails
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "Reshetova, Elena" <elena.reshetova@intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"x86@kernel.org" <x86@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"Nakajima, Jun" <jun.nakajima@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Kalra, Ashish" <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 7:06=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
> So I'm not convinced we can blindly wave away RDRAND failures as
> guaranteed to mean broken hardware.

Indeed, and now I'm further disturbed by the @intel.com people on the
thread making these claims that are demonstratively false.
