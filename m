Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D9522EE0
	for <linux-coco@lists.linux.dev>; Wed, 17 Jan 2024 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705513593; cv=none; b=axiROW48NyF5DrNjnyggFeCVWrJiuqyK9wJiiMqqRtuvairt/90aAujxSpVP07aL1/RTpEYP+hZeyhbRLQd+LkfcGwM7cF62RviMIK7SXktM6GMeUAKGGCw1F+s1b/zd+O7el89OAVzZLP+zhBgVuA6dB9y9PyxOQoCuJ97YXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705513593; c=relaxed/simple;
	bh=LTKMsVfgPN3dX5Bxo71zqeqMSBCzkJajVmflW4l7M3s=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=EZaK3A/u50s44lPQU2CvkbCr+tNx1sG6NeU2cX5LhAaWgb0Pw16lBUFoQFMpGjwNkVaBDyaEMXO5sV3CpYTh1PUsACklU62Oh/lgM5dNXcfrq4iqGvk8yk3D/Mg/BUROQwI37e8yOoXJqcCaFFrF8YksD0xyb5LIDFpIamIvF1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ow+HHvya; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ow+HHvya"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3600b2c43a8so181255ab.0
        for <linux-coco@lists.linux.dev>; Wed, 17 Jan 2024 09:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705513590; x=1706118390; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTKMsVfgPN3dX5Bxo71zqeqMSBCzkJajVmflW4l7M3s=;
        b=ow+HHvyavl/GBGp2BdWLdmKYUouxFgqYFSK6oGB+S4xU0/9SN9ZDtwc7ic4soH4jVI
         v1fRvBX3rwGkQqg3UBMff8HVRNrfS+XNYEDPNSUhmdeMp3NwTcFCpUVQ9E86QPriAwaR
         WkN1zIdImMtAAeKV7yQzxbKghlxmQ1JXnUwoeBVoRKZIMKFkiKyFbu94Filfhx6ISCCh
         Tg+Z6nxVxAI6+Di3FSDtSYv5NgLBBiKjgep9w7b3P9ei5i2L0uYS4KCKPhZl/Fzpf4zY
         OTdEJMzz6U7P0PF5aYiz7CssJM8+Kr/WEfcqGNyrL2oU5fI3rfnwhqlBB40HAaHX/np7
         IegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705513590; x=1706118390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTKMsVfgPN3dX5Bxo71zqeqMSBCzkJajVmflW4l7M3s=;
        b=GJEepUYMcZf1TWzrQzgcwNzkmpdGvgxPwPCjL5UFAOFiAnuEoHRDFxN6BaVZAvBaPd
         arQZwnaWmtg3U4ZVibDQcmqWldrQ97j/x57YUTyCl7SBLaV7EJTCGqR8CWj2XwjDfEBE
         VzaLYgk+W0XXqLrAvzFGAfdR+KS3nigPH2sgF5v8WUzaLtQRgLqtBg+3Mhb4I3MRMBMz
         49rHksxrAFT2KfPWWRS/EVPQyTCqgZLGugSlJj/n1Eszt3M2Y3HcjWCry5glIhhzEfxb
         dbwQuaCaalxWpddRAzwFNT0AzXj/1WB+7Btwntgo/ZBjos2V8mLwUrAeeLnCGCxQAojr
         v0bw==
X-Gm-Message-State: AOJu0Yw3eSDEm5qckSnoNlMhtpq0AFb0GvdXnmxvlFbeUFf4rFc0wwSk
	cMZ4iYs3TgkPZHuNp4xYUM+jJqKJmFlqSK1bqZ02hKgxOt7NiNggTo4BCcDU+sCwwS97zLmKNB8
	zfIa72fvYPlHe9bbU2+cC70xEqs5DT75HyEZu
X-Google-Smtp-Source: AGHT+IGtFbCZmFUqfkYUbnB0FjCccHeCoRnTNb6dFlkddBPkLRuY4MO0QvXtbj5atDcUYTDacJ7gj8wB/nUzvjZyqhs=
X-Received: by 2002:a05:6e02:1ca7:b0:360:36:8243 with SMTP id
 x7-20020a056e021ca700b0036000368243mr229349ill.20.1705513589860; Wed, 17 Jan
 2024 09:46:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6C4D2A02-3B78-4F3F-AD1A-87A1C24CB8CD@suse.de> <CAJ5mJ6ix_+pJc+ty8OgEdZt4gwBXhJd00DbhccESJYZh9_wsUQ@mail.gmail.com>
In-Reply-To: <CAJ5mJ6ix_+pJc+ty8OgEdZt4gwBXhJd00DbhccESJYZh9_wsUQ@mail.gmail.com>
From: Jacob Xu <jacobhxu@google.com>
Date: Wed, 17 Jan 2024 09:46:18 -0800
Message-ID: <CAJ5mJ6hJ_u62YwYae8Y6b7EFe6HRh8LBmtKyN5nCW8V8654_5w@mail.gmail.com>
Subject: Re: SVSM Development Call Jan 17th, 2024
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, carlos.bilbao@amd.com
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(re-sending as plain text instead of html message)

Hi Carlos,

Here's a link to the AP boot race condition mentioned during the call,
it's on the SNP host-kernel patches.

https://www.spinics.net/lists/kernel/msg5058122.html


On Wed, Jan 17, 2024 at 9:39=E2=80=AFAM Jacob Xu <jacobhxu@google.com> wrot=
e:
>
> Hi Carlos,
>
> Here's a link to the AP boot race condition mentioned during the call, it=
's on the SNP host-kernel patches.
>
> https://www.spinics.net/lists/kernel/msg5058122.html
>
> Jacob
>
> On Wed, Jan 17, 2024 at 4:48=E2=80=AFAM J=C3=B6rg R=C3=B6del <jroedel@sus=
e.de> wrote:
>>
>> Hi all,
>>
>> Just a reminder for todays SVSM Development call at 9am PST/6pm CET.
>>
>> If you have any agenda items you want to see covered, please let me know=
. Otherwise we will just do the usual rounds of updates and Q&A.
>>
>> We meet as usual at https://meet.google.com/ppv-xehx-dvb
>>
>> Regards,
>>
>> J=C3=B6rg R=C3=B6del
>> jroedel@suse.de
>>
>> SUSE Software Solutions Germany GmbH
>> Frankenstra=C3=9Fe 146
>> 90461 N=C3=BCrnberg
>> Germany
>> https://www.suse.com/
>>
>> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew McDonald, Werner Knoblich
>> (HRB 36809, AG N=C3=BCrnberg)
>>
>>
