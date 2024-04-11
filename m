Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A4814B067
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712831629; cv=none; b=VaopCS9GQrVigA5HEwYphpsOH9FapPSis7YtVz94APyEwsY0ZAr8LYxQf/TyiL/yufHY8Sx0qsWnugNTTMh5/wLOv9snz1gnDH2NUQjEUVPHxZkNHBOtKocu3fCpWK7tifTzdnG2aij+0pYIlod3+KK9ZKdYQrpnOKVFFm3xQqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712831629; c=relaxed/simple;
	bh=1fsu8gEjdQ0g6DT7ESHY6uJQyu+VrA4pW630i1w7pL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYiV9YBUh9VyC2UyBnhyoF2bhDy4aHxeOf4BjWJ7Q6F5iQ2vcIP0EsRXnPzLmj96vHgYCTJgwjSphWN2Zu1v93jis3+oIwPjfAyHlhY/C3fkenLhxSdlBuHC+TejqcokOltEyi2WxtmNwpxXkTj62VOe+1UOQSxrVrOg8g6sjUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0kk2z1z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0kk2z1z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F3BC433F1
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 10:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712831629;
	bh=1fsu8gEjdQ0g6DT7ESHY6uJQyu+VrA4pW630i1w7pL4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U0kk2z1zIKfe0Twn3pAs65nldEdGPQlv01OBjblVZ48v2YFwAzcKECkFQCxQ2tS1u
	 YkvgmS/T5/+yL1LCOiEd8gGaVxi2tMnmWb2+xLqAMfhmdx52HnY9KRzOJbs76pwSkt
	 CTfQq4JB+ZpCgZDFLYAWG910/5K9QOeu7x68kY/Xg1eO2Fqz60gjofDsbFYrBIrrKp
	 sE+fRlg+T84upEVMLpFcOZAT92rLy4Hk9aML5BldWI0nFcyft2y3Cg+KmyN1YQYjp3
	 SWMCTbMi/6kyCuY/QipDQfkmIuLQWjmdA+3JP4bwP+HVNBpgqsGFtiGdbgI1vOGMrf
	 zoCEiTZYH5sEQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516dbc36918so6482537e87.0
        for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 03:33:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0F6vv6E9+eHuNOzZt5NPtZxCHv4J8AvAUxNDhTM2Ce3qnTY0sLRaEINOzZK2gfk6AE0ZJfaWVVuKVtCVjpXJTqd2GTxkvVNb4Rw==
X-Gm-Message-State: AOJu0YzkOiO5U24zvdENKBZLfee3cFlbdSC9XKgnYm+jD+JqFun9w5tE
	Rn+8SmXEcHqty33N6Z4m5MdhKP3d8pHHj/rl8Kuu9zlqpMt6hdn9XW3Y8+VRd+6Oa4Ev2IEzb3i
	ROzDVoZza7g8ypBY4z/ZUOPf+IZo=
X-Google-Smtp-Source: AGHT+IHYCFuXPzBDTBz7yrg+0lASIEr/L9MG1gNRCGPhRMrMICzuE2ua0gLM4X6q7jJZ/Ea3ZdH0d94h+zLsR+kCkes=
X-Received: by 2002:a2e:b002:0:b0:2d6:cbf2:ed2b with SMTP id
 y2-20020a2eb002000000b002d6cbf2ed2bmr3696084ljk.30.1712831627724; Thu, 11 Apr
 2024 03:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
 <ZgF3ACjFj8LtUWgv@himmelriiki> <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
 <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
 <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
 <dd6vsgt7aayspdhzkqrjsthuiexig4apvhc4ikoeewx62iqmva@rajndsnzoppq>
 <MW4PR11MB5872EEE1B69DECA4559DD48B8C052@MW4PR11MB5872.namprd11.prod.outlook.com>
 <paod4p2nuaobaevggnivxyzjcxi6fxmydo7wm2gjuzo52ep5ah@httyzmycr6bi>
In-Reply-To: <paod4p2nuaobaevggnivxyzjcxi6fxmydo7wm2gjuzo52ep5ah@httyzmycr6bi>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 11 Apr 2024 12:33:36 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFDCThQhvVvDknV9GDzG2HWLPR4LC94CHhuckGE41Nvvw@mail.gmail.com>
Message-ID: <CAMj1kXFDCThQhvVvDknV9GDzG2HWLPR4LC94CHhuckGE41Nvvw@mail.gmail.com>
Subject: Re: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
To: devel@edk2.groups.io, kraxel@redhat.com
Cc: jiewen.yao@intel.com, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Mikko Ylinen <mikko.ylinen@linux.intel.com>, James Bottomley <jejb@linux.ibm.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	qinkun Bao <qinkun@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Peter Gonda <pgonda@google.com>, "Johnson, Simon P" <simon.p.johnson@intel.com>, 
	"Xiang, Qinglan" <qinglan.xiang@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 12:29, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Apr 11, 2024 at 09:56:48AM +0000, Yao, Jiewen wrote:
> > Please allow me to clarify what you are proposing:
> > Do you mean in vTPM case, we extend both, but we only need TCG event log, NOT CC event log?
>
> Elsewhere in this thread it was mentioned that writing both vTPM and
> RTMR events to the event log is problematic because the event log format
> has no field to specify whenever a given event was measured to vTPM or
> RTMR.
>
> If the firmware can make sure all events are measured to both vTPM and
> RTMR the need to trace them separately goes away.
>
> So, yes, in case a vTPM is present the firmware would:
>   (a) expose EFI_TCG2_PROTOCOL, measure to both vTPM + RTMR
>   (b) not expose EFI_CC_MEASUREMENT_PROTOCOL
>   (c) log measurements to TCG event log
>

A TDX attestation would require the PCR to RTMR mapping used by the
firmware in order to reconstruct the RTMR values from the TCG event
log, but that seems feasible to me.

In any case, I think it should be the guest firmware's job to abstract
away the difference.
