Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890FD3033DF
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896091; cv=none; b=g6fqHM5RhuL8NiHiJHmmbTg4lt49KkcKFE+l+A66rCe4X7gY3VJm1wRupaBHoE099X8L8vDxDQcIZTIwdHQX7UaE45Njuhyvj8C+6uNNHy/VBLb82DA82ig26K7gOFSnOOAxwu5pyAru8tq5FaLM+iL/eD9Jr01KIcfXM3/w154=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896091; c=relaxed/simple;
	bh=1ec+pVpqeVLhWCe7xUB7KjuK6D+1xR+jbGakCt2aScw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVdo/ycd7zKNpjK0ZPbfi8MtGU0rqaAEnqEk6/YFOe/fb4k1tYsgISIyhgibr0TKbq3ee5s/0fqC8GHapNwHRtgSt8u6oN9kPIglvhwNIz7YytpCJaGyiknxRidakebivrSarTHFKl1y6wTswwclKPH6B6jJ6gNRZ2pNT7s8Vjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9sLs+M0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9sLs+M0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso81953175e9.2
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779896087; x=1780500887; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rF1sdUt+x3ES0J+bZHKGMYq3dPxPJDXhYXNfFWraH5k=;
        b=C9sLs+M0aYiltT2/XRiNLKxjAW/jQBpAAY7Xq3QsGm6uffPm/iBdlkr1ath0XAHXOT
         p4B4pk9QXnki8tYarjMsMlC+p3O5WnUSpYHl83Jbd3suIPoVfhrb7NZyfhYj+cWpxMcO
         RT2pDc+64HMw25KMCqMtNhuavwuG8R9u5BXDQCeg1oGw1mM+yNr+UBtD31GTiRUB3lVP
         PvJXIYYmb1CWncorJ2LOImaHKZnu8tncViL50wRxLIc9SmxmTySYZ3Bi/m3PUlm5LV6Z
         ui5nam/i+1pbmkCvI3hS7zfzQLJ61KK+mZFRHCYkpnsoqt84snwiKRgkuME3CTok3zBT
         Kc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896087; x=1780500887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rF1sdUt+x3ES0J+bZHKGMYq3dPxPJDXhYXNfFWraH5k=;
        b=CaKYk9gSk6Vz7PH+SlFeIdcC9wFsd9WuS8Rb0DlwmGuZHJfSgtovxb4vbQNQgKq+eO
         jWJB7dUw4wSoEU4HZr+fX5wbEuYSHFp/Nt4jRXol/RQ1h9iW9Hyp15d99ierNm5P5FQ+
         8WFASofO/A1wnXIU/4ZcuB0bK6uEQh7uMNq+bExgZaUp4MqeiPajRG0MRaUctfD2yZPl
         INgf/axHU525uv3Kh96NHJU5V/wV3kylup5JBcgv/23gHpMEXO/twJ/V+8uNV3QmHwJv
         F/Io1UCV3pnB/ALoCqhs6VyYR+tLD8rheoqrrEn+mq3ILzbTS/fJsI+YOC5A/T6T7m7d
         aOQg==
X-Forwarded-Encrypted: i=1; AFNElJ+8+xmVw/gpmKpPSk6QAzb94RcpD9AWq/X2W2Uauth2Te8XUSpijg43ZZ2AX4g76uRJ9cqPJnNo074g@lists.linux.dev
X-Gm-Message-State: AOJu0YxrRYT8pm+/XGVI3/fRYJoRtwhRKSLNpykH2c3l/YaVfDbthLyZ
	9VegmHKd9iYbhtl3LwqtkNNgwmlRo4qmwlE1yPw2Kbk61Jsy1+FNExT2
X-Gm-Gg: Acq92OGJfMV4Sr42smr5WssTjIou3VwCS+d4uFP2IrePuc1L08M96pRKE1Qz/aH95Dj
	kEvIHYt/7KPi3qAhx4xj43D9ecplYVDsGQ77Rk69KwgtZ8J8FlMzyJUK7NAq+ptrJh+LpYP46lh
	1kssZvD2G34jEpy8/kWD6gkI/NC2Y/tnt8+19hjnTe++j4oatBvTQBWs0mHSbEq8kAA0VIGRfKw
	K/3uI0zSlqMF/IeK2KrrsYiPqHu40KSktYyqPyrSHVwqZaiIMkSKuSWISbi7b6l6MNLvqzVJ+xQ
	eh6SG8t08ra3hV94GHi853ddwQ8QiXEHY49+e/Dwj+FLgRCjAASL0wcd569P86OAeycSuTBbWwJ
	94RLKXY5+t0+XtKrPBvb7E7Nn1rchzXvMPaJZ8Tkx1Y6gq7fGxGxDnhGut/yMX0pnSZ1miNdj03
	m630HzZT6NAVqtYfidweyuQ2X+03JKMFnEvqfs5Rd7xul4BQJ6kGLV6o99hmSg/opdTMOnQ4NvX
	9bD+PU=
X-Received: by 2002:a05:600c:c4a1:b0:490:3fd9:e78b with SMTP id 5b1f17b1804b1-490426cef8bmr400420045e9.17.1779896087157;
        Wed, 27 May 2026 08:34:47 -0700 (PDT)
Received: from [192.168.1.50] (static-82-85-206-37.clienti.tiscali.it. [82.85.206.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908098f57asm18458415e9.20.2026.05.27.08.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:34:46 -0700 (PDT)
Message-ID: <ecd045de-8649-4bd6-a3e2-fecb6371f7b3@gmail.com>
Date: Wed, 27 May 2026 17:34:45 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM Development Call May 27th, 2026
To: Stefano Garzarella <sgarzare@redhat.com>, coconut-svsm@lists.linux.dev,
 linux-coco@lists.linux.dev
Cc: Tanish Desai <tanishdesai37@gmail.com>
References: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
 <CAGxU2F4uJLH5OTv+y4712vmNBogfSspN-nJHzDJAz9N6HWeg2g@mail.gmail.com>
Content-Language: en-US
From: Nicola Ramacciotti <niko.ramak@gmail.com>
In-Reply-To: <CAGxU2F4uJLH5OTv+y4712vmNBogfSspN-nJHzDJAz9N6HWeg2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 5/27/26 17:12, Stefano Garzarella wrote:
> On Tue, 26 May 2026 at 17:46, Stefano Garzarella <sgarzare@redhat.com> wrote:
>> Hi,
>>
>> Here is the call for agenda items for this weeks SVSM development
>> call. Please send any agenda items you have in mind as a reply to this
>> email or raise them in the meeting.
> One topic could be the 2 GSoC projects we have this year.
> If Nicola and Tanish join, it would be nice to allow them some time to
> present their projects. They will work with the COCONUT community
> during the summer :-)


Great. I'll be there!

Regards,
Nicola


>
> Stefano
>
>> We will use the LF Zoom instance. Details of the meeting can be found
>> in our governance repository at:
>>
>>          https://github.com/coconut-svsm/governance
>>
>> The link to the COCONUT-SVSM calendar is:
>>
>>          https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week
>>
>> The meeting will be recorded and the recording eventually published.
>>
>> Regards,
>> Stefano
