Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875BA1D558
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712831387; cv=none; b=LDqLhDdtESwMHFBFNP9eLI1YoJ0Xsj40dVA1FrMWAK2Hecje1OZRLDBpeI/PARlOg46fOYYNjIFSYBDV2hp1AhWBcBSsxUv/WoVsCnixejgxcGzYRHhyKykoIUTJRtPhgWYyyVucw9CSCCEjsCUpA3T/NJDMyWs8JiXzB8tDaXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712831387; c=relaxed/simple;
	bh=Op+01XxtgM0m9LpbwB5l2Rz9UPwqaxwkdV2KR3TwElw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=b0vUTmf62OnH1BwXWPdVNaNzfLdHDayRNaA6xnz0Wn0r+5ALQ9oc5t3OeFxFfVZsFkjfDYJz8SqMi1eVWsia2tqGs3x6zDJoJFk3z/wyV2RqiU/fn429fucS6xqv7wPiZYF8+wjq2GgQopSx5dAjWSqMjJ7YIAVhpaaS3Dv44Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzlsrjuX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzlsrjuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712831384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UIoCC5q2pBtGBNi8OVPIoE6M6+SdVAJp82el3Auwfyc=;
	b=fzlsrjuX/CaXH4W6w+sMLJMAj9e09Y46ANgiMNlI92b26BKT6dx8mP6M7Fr7xJFHy9Ud2Y
	VE3t1NX8FQtHlz46BowzZBWz45iYU+0KVjSLyAcJuVJSbTvrypmAIaARGjvKirO/6vJaTz
	gWdwm6ItjkPhxmXFGuBYzHVuwqEzP4c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-_9LLabuZOKqgYMFQFhYYRg-1; Thu, 11 Apr 2024 06:29:38 -0400
X-MC-Unique: _9LLabuZOKqgYMFQFhYYRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D168E1049BC6;
	Thu, 11 Apr 2024 10:29:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.204])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FC872026962;
	Thu, 11 Apr 2024 10:29:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6041A180063D; Thu, 11 Apr 2024 12:29:32 +0200 (CEST)
Date: Thu, 11 Apr 2024 12:29:32 +0200
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: devel@edk2.groups.io, jiewen.yao@intel.com
Cc: Ard Biesheuvel <ardb@kernel.org>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
	James Bottomley <jejb@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, qinkun Bao <qinkun@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Peter Gonda <pgonda@google.com>, "Johnson, Simon P" <simon.p.johnson@intel.com>, 
	"Xiang, Qinglan" <qinglan.xiang@intel.com>
Subject: Re: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
Message-ID: <paod4p2nuaobaevggnivxyzjcxi6fxmydo7wm2gjuzo52ep5ah@httyzmycr6bi>
References: <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
 <ZgF3ACjFj8LtUWgv@himmelriiki>
 <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
 <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
 <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
 <dd6vsgt7aayspdhzkqrjsthuiexig4apvhc4ikoeewx62iqmva@rajndsnzoppq>
 <MW4PR11MB5872EEE1B69DECA4559DD48B8C052@MW4PR11MB5872.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <MW4PR11MB5872EEE1B69DECA4559DD48B8C052@MW4PR11MB5872.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 11, 2024 at 09:56:48AM +0000, Yao, Jiewen wrote:
> Please allow me to clarify what you are proposing:
> Do you mean in vTPM case, we extend both, but we only need TCG event log, NOT CC event log?

Elsewhere in this thread it was mentioned that writing both vTPM and
RTMR events to the event log is problematic because the event log format
has no field to specify whenever a given event was measured to vTPM or
RTMR.

If the firmware can make sure all events are measured to both vTPM and
RTMR the need to trace them separately goes away.

So, yes, in case a vTPM is present the firmware would:
  (a) expose EFI_TCG2_PROTOCOL, measure to both vTPM + RTMR
  (b) not expose EFI_CC_MEASUREMENT_PROTOCOL
  (c) log measurements to TCG event log

take care,
  Gerd

