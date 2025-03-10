Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BAF1EEA30
	for <linux-coco@lists.linux.dev>; Mon, 10 Mar 2025 22:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741645600; cv=none; b=Zk8wc5vWcbOpJNuHDQ4kL2bVxz/ZQgYjEbX+g3w1UXNlFCeq/dFOSK9cWSHCIf37/5dGNgN5Q9pqmyogD+GWKyH0mHDzUUFyMS1V4UN2ugr7M5tKQ0cZwn39zI/rDHmMPuUUmQ5Kv9fxR4dyLUIpW8sMbQ6jlZEuiFR7zv+UF4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741645600; c=relaxed/simple;
	bh=a4SY1LReQ7ssRoDgFBMXMrLIoDT7bPpjoZxuotGN+pU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=U1SalXewUp1HwE35S7SG7syTRNtabmyQePhpL551y/lrDQFQ7irLdUb+KmfsJ8qM7atxaoJ6lGoxWDzkrsZKYZjukTAwwNVoAF9CuLOBcKBD0kWgloUd9JyJmbVcJmkFEbdBLu1w9mGLoyjroxx2kUWjM2JA/W9IZYu2ALc5RuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rK8pDVQk; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rK8pDVQk"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d42f08219so1238006241.0
        for <linux-coco@lists.linux.dev>; Mon, 10 Mar 2025 15:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741645597; x=1742250397; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a4SY1LReQ7ssRoDgFBMXMrLIoDT7bPpjoZxuotGN+pU=;
        b=rK8pDVQkHBWaMX88QtOGqysWsVNl3lm9UcPsZqDo1tqJwyf/O8J5APmpwDKGYIwVSX
         tZyiFZ+KClXpLjQFv40Eat0NsvuLTFx3uWOqayUc3uzgd1/rxbzhE8sNUKnF0E14G1su
         4cj8IFGRZJKCIKCG/+yDtiMCKFymEB3rk7SO2LzlOi7PmgOVK8Nah6xpiI7rHEwbJ8gB
         +dddmUXiWI8WIYfBBEYZMrLCo4Aw3j/IctkyXsh691szUdkpIwAnLQWKSdBLix2Eo2kx
         i692rIwt/JsoJzsz/7jvLynvNlXENdCALHYOeXuzdZqm1loZEcH/cWebQzVW6w9YZxw6
         fo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741645597; x=1742250397;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4SY1LReQ7ssRoDgFBMXMrLIoDT7bPpjoZxuotGN+pU=;
        b=TX83ff5sYv0S+/Dtz0v2vLqutlTQUpHVjREemSJrjpR4wCyRAZjdSZeAvvOJFX3XL1
         RPrXAg+Xjat8popAA5rUHmWRHVHkWbbKJBHqEDNfU/6e8FO5s33zRBet999xJbR1Els+
         Z7/SoTYZH6QwEm0EYaL1Frpbdl8Erchu4ms1IFHIlSgAk2FG1PYvOk72JCk1BpG0yd6l
         OrXkmCPQkkV2E4BtNWCTXRNsmTBKx9IVN5FC1l+vJXw/Lhm2g9C7dbGTfsTBbFIm2VGT
         M0Twgv9FaKbkBIntB5Z6ggDiZmbOxYemnSUKSkJJvdOBkmQALQIbfGJ79hqAp5XKcddy
         lTNw==
X-Gm-Message-State: AOJu0Yy91G3PXvLbNRXGnGsL19lYH+/VrfJoW//9/4vyo2gOWW2k9SQO
	NgSCba7JtHklxjy/D5D38AtUNrZ9AOEAsgttNq5qPF7RT7abXtGeu1IEs5T0xVRlW8ibczKmzTp
	pqX79B9BikeyvwOHr43IIRQp574kSRJeHGchb73M1HUrE46kiDQ==
X-Gm-Gg: ASbGncv1MhkaHUgCulo/gt3VD9fOioANRXiNq+smkcSjMYKYUAQeVXK5RYBb3wz6YVn
	UKBcqgRPyTvdlxj3NnbIBR+NJLdcOH6KEFKLWaSfsM7nmd17w3Enzcp1uVcdW0r7gkZKp/a5yEr
	XA7OLIfYi5CLXFTG5BCImxrrVVyv/sketFdWyvzSx66XsvE8oHID2VddYo
X-Google-Smtp-Source: AGHT+IHX+qsaxc+WRcSVtHfdxaQykeidVVWVSxoJrUjt1H5R6l5LcUyDlvCmA0sTV14tLEvnDP+d85mfhMn0PgRPfrk=
X-Received: by 2002:a05:6102:3fa3:b0:4c1:9d9b:54b8 with SMTP id
 ada2fe7eead31-4c34d20b9e5mr1576272137.2.1741645597089; Mon, 10 Mar 2025
 15:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Mon, 10 Mar 2025 15:26:00 -0700
X-Gm-Features: AQ5f1JqLexFm2gScWfsHzaAg1LxHdJpudnt01vhPk7h7ib2j0omekVavoON-Zh8
Message-ID: <CABayD+dsAeqQnX7izBA-RkyM5W6p7zg+hgvVEo8B2i6L-WrHVw@mail.gmail.com>
Subject: Kernel SIG meeting 3/13 - Continuing discussions on SVSM
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

We have another instance of the Kernel SIG coming up, at 9AM PDT on
Thursday, March 10th.

**Be aware of the DST skewing that happens this time of year!** The USA
jumped forward an hour, and, for example, Europe won't do so for
another ~3 weeks. The meeting will be an hour for much of the world
(e.g. 4PM in the UK, 5PM in Germany).

Zoom link - https://zoom-lfx.platform.linuxfoundation.org/meeting/92401169243?password=e6c02995-6cfb-4f90-82b6-747f767eb168
Agenda - https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIlK2_bd4/edit?tab=t.0
Calendar - https://confidentialcomputing.io/get-involved/calendar/

We should continue discussions of OS <-> SVSM communication. If you
have concrete questions/topics, please add them to the agenda. Any
topic, not just the SVSM, is welcome.

Thanks,
Steve
