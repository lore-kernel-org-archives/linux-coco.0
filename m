Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5D21DDC26
	for <linux-coco@lists.linux.dev>; Thu, 21 Nov 2024 23:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732230592; cv=none; b=fRrxmpbxmqp2afOWVSR20uhmBSuA+zcIlCHOVimHeO22TD3FgYqMc9fgac5nAZWHDJ8MT8WWvQpQ0/vepDluRqVeHWE07odWGMMJZynLNXdn9yZPw+8bMtK9wp1MD31Vuhr7pOZSha1nu4exuhLk4O8S2qQOUhYPZCNEuDEaSAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732230592; c=relaxed/simple;
	bh=TwrKBIwQYUmOqb8S90MF2dDA3sR/5gS18OKZoTZD6UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIHGj/nBjRD3DhTEidwYIJ7W86kMqKBa6VBYrmSE1tmQ3e8Euj292biQFgW0qFcVwiI3X8JrNhZk1IT2Xz0oi880LCe3+PQoZaeMaoRrSI0tpOZNla4qcjgE9Yio1yN775WGxtMfBNJgpgPjElscAIqA8wx0Ht2bL0ONyy+8qyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=agUoNn2A; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="agUoNn2A"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so12687415e9.2
        for <linux-coco@lists.linux.dev>; Thu, 21 Nov 2024 15:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732230589; x=1732835389; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwrKBIwQYUmOqb8S90MF2dDA3sR/5gS18OKZoTZD6UI=;
        b=agUoNn2A+H9l+4NbCSJN6uUFlXdMYfmMdag1SF0/NW+AM5nhdgTbrFEThq1t/k0x+H
         auDMRox/WgZSfaOOz+aBlF0bwJ0+0NWGdgGgEkAdFv7DAr1++TCf6wJyTxnMMqU/waPK
         9gwO919ypW9SHPg53ASofxHxjNd/2WG9flGpQic4T5txYTzMtskgSjDO8wXE7mlPtLkb
         2YekJ8O+CmTE1FqsqS5NKOYjbwG6/75RDPtkLtW6bLlpJDt+BtLxs+NGZv5akMNsrgLd
         mZmDgPX5e78d2b1aKSAyZL2BZM+yY9JSZtLJyhL/yhabt0JQ/10ISGUbkOTn9e0ZBWIT
         expw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732230589; x=1732835389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwrKBIwQYUmOqb8S90MF2dDA3sR/5gS18OKZoTZD6UI=;
        b=DAUKigElfRA38mc6v9fr28ZWnuhsOdSWotQBYrPHkLZOoRzBIhQEalqEn3UrYBRide
         oxvwejHJA8fGAaXhFxUFNtMbCWWEONqUZaxGE1N1hnMZfTvczSpNEfm4zswdfP05hSxr
         cG22zhF0JkqpaHmplDDvR/lMQJEKCOBq90918oUyKG86Epu34sMz8QM8DOMuzcgfKuwV
         0JCYrjr0MELfaer1ZpBBglG3S47b/2FxDUl3uVFpChN710keFZQyV1AzqQluQ1fju5ia
         vEbSeewVibhG2HIK4oTihdn9BU1YwSxHhhyAeu9RkjIAT5MhvP4aXoELTm0tH8BPw+kd
         t/qw==
X-Gm-Message-State: AOJu0Ywrl2Y3vQwHVsRGlM7nXoAEssD67jvr1Jh4qoDxMoxQR96ujTGW
	SHcMMAVOPjzGsZ76yxujK1BzBDMQ1eIMHSgd1hIXE3GuKboGur644a7OCdza7hCI6awQpSSypEJ
	vnfM27VlUoJgWdSTGQhokBZ3WaN/MRZG5z6zL
X-Gm-Gg: ASbGncuPccSAzZINf+yR6U1uJUqDMuMleB9+QGl+2SJif58fLnPaiMi1W9mK9dQRlwD
	+tfPxrJjGcQLo/JQ7JWw9/s4YvyRYIkZM3ws1+U7tmS0w0O60aP4zH+I4qKMb
X-Google-Smtp-Source: AGHT+IErGE0dKMVo7WCU6q/8q7lNibhpSwSbUQ+zENhXCW52DK9/dH7DOb/G4GDGfoRyayiGNpE9h9doYt3zGtutpQ8=
X-Received: by 2002:adf:e18c:0:b0:382:2d59:b166 with SMTP id
 ffacd0b85a97d-38260b83dfbmr668749f8f.31.1732230588654; Thu, 21 Nov 2024
 15:09:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <51d1a968-85a1-4be9-8dc8-ee36c46d0de6@linux.intel.com>
 <cd797e42-c5a9-47d9-96bf-5f33c3645d5a@linux.intel.com> <8c07d07d-ffc2-40f1-aad2-b3d7998e9f54@linux.intel.com>
 <CABayD+cBkTsWkzExrFh4YqgzgsPcKdz3EpZ=V9=od+0E+v_CXQ@mail.gmail.com>
In-Reply-To: <CABayD+cBkTsWkzExrFh4YqgzgsPcKdz3EpZ=V9=od+0E+v_CXQ@mail.gmail.com>
From: Steve Rutherford <srutherford@google.com>
Date: Thu, 21 Nov 2024 15:09:11 -0800
Message-ID: <CABayD+do4JP7Qb0xBvLJ3iEdwvR3w7DbHt8E6=ButFFYJFTLBg@mail.gmail.com>
Subject: Re: Confidential Computing Kernel SIG 2024-11-22
To: Dan Middleton <dan.middleton@linux.intel.com>
Cc: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If anyone has topics for tomorrow, feel free to add them to the agenda
in the Meeting Minutes document:
https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIlK2=
_bd4

In the absence of an agenda, we'll likely cancel tomorrow's meeting.


On Thu, Nov 21, 2024 at 3:02=E2=80=AFPM Steve Rutherford <srutherford@googl=
e.com> wrote:
>
> If anyone has topics for tomorrow, please add them to the agenda in the M=
eeting Minutes document: https://docs.google.com/document/d/18D820gyt2xe84J=
y6dGXgrNThApoozcekDzvIlK2_bd4
>
> In the absence of an agenda, we'll likely cancel tomorrow's meeting.
>
> On Thu, Nov 21, 2024 at 9:16=E2=80=AFAM Dan Middleton <dan.middleton@linu=
x.intel.com> wrote:
>>
>> Sorry.. timezone confusion. Just check the link for your timezone
>>
>> <sigh>
>>
>>
>> > On 11/21/24 10:56 AM, Dan Middleton wrote:
>> >> Hi everyone,
>> >>
>> >>
>> >> Looks like we have an open agenda for Friday.
>> >>
>> >> If you have topics please reply on this thread.
>> >>
>> >> https://confidentialcomputing.io/get-involved/calendar/
>> >>
>> >>
>> >> Thanks,
>> >> Dan
>> >>
>> >>
>> >
>>
